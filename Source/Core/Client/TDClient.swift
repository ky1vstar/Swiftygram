//
//  TGClient.swift
//  Swiftygram
//
//  Created by KY1VSTAR on 5/16/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import tdjson

final public class TDClient {
    
    public let authorization: TDAuthorization
    public let configuration: Configuration
    
    private let client = td_json_client_create()
    private let executionQueue = DispatchQueue(label: "TDClient.executionQueue", qos: .background, attributes: .concurrent)
    private let processingQueue = DispatchQueue(label: "TDClient.processingQueue")
    private let runLoopQueue = DispatchQueue(label: "TDClient.runLoopQueue")
    
    private let queryLock = MutexLock()
    private var completionHandlers = [UInt64: TDDataResultHandler]()
    private var queryTimers = [UInt64: DispatchOnceTimer]()
    private var nextQueryId: UInt64 = 0
    
    private let updateLock = MutexLock()
    private var updateHandlers = [HashableType: UpdateObserverInfo]()
    private var anyUpdateHandlers = [UInt64: UpdateHandler]()
    private var anyUpdateNextId: UInt64 = 0
    
    var authorizationStateObservation: TDCancellable?
    let internalAuthorizationState = TDSubject<TDEnum.AuthorizationState?>(nil)
    
    public init(authorization: TDAuthorization, configuration: Configuration = .default) {
        self.authorization = authorization
        self.configuration = configuration
        
        authorizationStateObservation = observeUpdates(for: TDObject.UpdateAuthorizationState.self, updateHandler: { [weak self] update in
            self?.internalAuthorizationState.value = update.authorizationState
        })
        
        start()
    }
    
    deinit {
        td_json_client_destroy(client)
        
        // notify all completion handlers
        queryLock.lock()
        
        let completionHandlers = self.completionHandlers
        self.completionHandlers = [:]
        queryTimers = [:]
        
        queryLock.unlock()
        
        processingQueue.async {
            completionHandlers
                .sorted(by: { $0.key < $1.key })
                .forEach { _, completion in
                    completion(.failure(.cancelled))
                }
        }
    }
    
    /**
     Sends a request to the TDLib.
     
     - Parameter function:
     */
    public func execute<Function>(
        _ function: Function,
        callbackQueue: DispatchQueue? = nil,
        timeoutInterval: TimeInterval? = nil,
        completionHandler: TDResultHandler<Function.ReturnType>? = nil
        ) where Function: TDFunctionProtocol {
        
        executionQueue.async {
            var queryId: UInt64?
            var responseHandler: TDDataResultHandler?
            
            // response parser
            if var completionHandler = completionHandler {
                completionHandler = (callbackQueue ?? self.configuration.callbackQueue).wrap(completionHandler)
                
                responseHandler = { result in
                    switch result {
                    case .success(let data):
                        do {
                            let object = try JSONDecoder.swiftygram.decode(Function.ReturnType.self, from: data)
                            
                            completionHandler(.success(object))
                        } catch {
                            completionHandler(.failure(.decoding(error)))
                        }
                        
                    case .failure(let error):
                        completionHandler(.failure(error))
                    }
                }
                
                queryId = self.pushCompletionHandler(responseHandler!, timeoutInterval: timeoutInterval ?? self.configuration.timeoutInterval)
            }
            
            // encoding and executing
            let wrappedFunction = FunctionWrapper(function: function, queryId: queryId)
            
            do {
                let data = try JSONEncoder.swiftygram.encode(wrappedFunction)
                
                self.send(data: data)
                
            } catch {
                if let queryId = queryId, let completionHandler = self.completionHandler(for: queryId) {
                    completionHandler(.failure(.encoding(error)))
                }
            }
        }
    }
    
    private func send(data: Data) {
        var data = data
        
        data.append(0)
        
        data.withUnsafeBytes({
            td_json_client_send(self.client, $0)
        })
    }
    
    // MARK: - Run loop
    private func start() {
        runLoopQueue.async { [weak self] in
            while let self = self {
                guard let result = td_json_client_receive(self.client, 10) else { continue }

                let string = String(cString: result)

                self.processingQueue.async {
                    guard let data = string.data(using: .utf8) else { return }
                    
                    self.processData(data)
                }
            }
        }
    }
    
    // MARK: - Update observation
    public func observeUpdates<Update>(
        for update: Update.Type,
        updateHandler: @escaping ((Update) -> ())
        ) -> TDCancellable where Update: TDObject.Update {
        
        updateLock.lock(); defer { updateLock.unlock() }
        
        let updateHandler = configuration.callbackQueue.wrap(updateHandler)
        let hashableType = HashableType(Update.self)
        
        if updateHandlers[hashableType] == nil {
            updateHandlers[hashableType] = (0, [:])
        }
        
        let id = updateHandlers[hashableType]!.nextId
        updateHandlers[hashableType]!.nextId += 1
        updateHandlers[hashableType]!.handlers[id] = { update in
            if let update = update as? Update {
                updateHandler(update)
            }
        }
        
        return TDCancellable { [weak self] in
            guard let self = self else { return }
            
            self.updateLock.lock(); defer { self.updateLock.unlock() }
            
            self.updateHandlers[hashableType]?.handlers[id] = nil
        }
    }
    
    public func observerUpdates(
        with updateHandler: @escaping ((TDObject.Update) -> ())
        ) -> TDCancellable {
        
        updateLock.lock(); defer { updateLock.unlock() }
        
        let id = anyUpdateNextId
        anyUpdateNextId += 1
        anyUpdateHandlers[id] = configuration.callbackQueue.wrap(updateHandler)
        
        return TDCancellable { [weak self] in
            guard let self = self else { return }
            
            self.updateLock.lock(); defer { self.updateLock.unlock() }
            
            self.anyUpdateHandlers[id] = nil
        }
    }
    
    // MARK: - Data processing
    private func processData(_ data: Data) {
        let response: TDLibResponse
        
        do {
            response = try JSONDecoder.swiftygram.decode(TDLibResponse.self, from: data)
        } catch {
            print("Error while processing response: \(error)")
            return
        }
        
        if let type = response.type, type.hasPrefix("update") {
            processUpdate(data)
            return
        }
        
        guard let queryId = response.queryId,
            let completionHandler = self.completionHandler(for: queryId) else {
                return
        }
        
        if response.type == TDObject.Error.type {
            do {
                let error = try JSONDecoder.swiftygram.decode(TDObject.Error.self, from: data)

                completionHandler(.failure(.tdLib(error)))
            } catch {
                completionHandler(.failure(.decoding(error)))
            }

            return
        }
        
        completionHandler(.success(data))
    }
    
    // MARK: - Update processing
    private func processUpdate(_ data: Data) {
        let updateObject: TDObject.Update
        
        do {
            updateObject = try JSONDecoder.swiftygram.decode(SubclassCodable<TDObject.Update>.self, from: data).value
        } catch {
            let kek = String(data: data, encoding: .utf8)!
            print(kek)
            print("Failed to parse Update")
            return
        }
        
        updateLock.lock()
        
        let updateHandlers = self.updateHandlers[HashableType(type(of: updateObject))]?.handlers ?? [:]
        let anyUpdateHandlers = self.anyUpdateHandlers
        
        updateLock.unlock()
        
        for (_, handler) in updateHandlers {
            handler(updateObject)
        }
        
        for (_, handler) in anyUpdateHandlers {
            handler(updateObject)
        }
    }
    
    // MARK: - Utils
    private func pushCompletionHandler(_ completionHandler: @escaping TDDataResultHandler, timeoutInterval: TimeInterval) -> UInt64 {
        queryLock.lock(); defer { queryLock.unlock() }
        
        let initialQueryId = nextQueryId
        nextQueryId += 1
        
        completionHandlers[initialQueryId] = completionHandler
        
        if timeoutInterval > 0 {
            queryTimers[initialQueryId] = DispatchOnceTimer(queue: processingQueue, delay: timeoutInterval, eventHandler: { [weak self] in
                self?.completionHandler(for: initialQueryId)?(.failure(.timedOut))
            })
        }
        
        return initialQueryId
    }
    
    private func completionHandler(for queryId: UInt64) -> TDDataResultHandler? {
        queryLock.lock(); defer { queryLock.unlock() }
        
        queryTimers[queryId] = nil
        
        return completionHandlers.removeValue(forKey: queryId)
    }
    
    func generateTdlibParameters() throws -> TDObject.TdlibParameters {
        let fileManager = FileManager.default
        var databaseURL: URL
        var filesURL: URL
        
        if let appGroupId = authorization.appGroupId {
            guard let appGroupURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupId) else {
                throw TDAuthorizationError.invalidAppGroupId
            }
            
            databaseURL = appGroupURL
            filesURL = appGroupURL.appendingPathComponent("Library/Caches")
        } else {
            databaseURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
            filesURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        }
        
        let pathComponent = ".Swiftygram/\(authorization.accountId)"
        databaseURL.appendPathComponent(pathComponent)
        filesURL.appendPathComponent(pathComponent)
        
//        try fileManager.createDirectory(at: databaseURL, withIntermediateDirectories: true, attributes: nil)
//        try fileManager.createDirectory(at: filesURL, withIntermediateDirectories: true, attributes: nil)
        
        return .init(useTestDc: authorization.usesTestEnvironment,
                     databaseDirectory: databaseURL.path,
                     filesDirectory: filesURL.path,
                     useFileDatabase: configuration.usesFileDatabase,
                     useChatInfoDatabase: configuration.usesChatInfoDatabase,
                     useMessageDatabase: configuration.usesMessageDatabase,
                     useSecretChats: configuration.usesSecretChats,
                     apiId: authorization.apiId,
                     apiHash: authorization.apiHash,
                     systemLanguageCode: configuration.systemLanguageCode,
                     deviceModel: configuration.deviceModel,
                     systemVersion: configuration.systemVersion,
                     applicationVersion: configuration.applicationVersion,
                     enableStorageOptimizer: configuration.enableStorageOptimizer,
                     ignoreFileNames: configuration.ignoresFileNames)
    }
    
}
