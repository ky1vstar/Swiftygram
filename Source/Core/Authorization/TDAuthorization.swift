//
//  TDAuthorization.swift
//  Swiftygram
//
//  Created by Oleksandr Zhuhan on 7/5/19.
//

import Foundation

public final class TDAuthorization: NSObject, Codable, NSSecureCoding {
    
    public static var supportsSecureCoding: Bool {
        return true
    }

    let apiId: Int
    let apiHash: String
    let accountId: String
    let usesTestEnvironment: Bool
    let appGroupId: String?

    init(apiId: Int, apiHash: String, accountId: String, usesTestEnvironment: Bool, appGroupId: String?) {
        self.apiId = apiId
        self.apiHash = apiHash
        self.accountId = accountId
        self.usesTestEnvironment = usesTestEnvironment
        self.appGroupId = appGroupId
    }

    public init?(coder aDecoder: NSCoder) {
        guard let apiId = aDecoder.decodeObject(of: NSNumber.self, forKey: CodingKeys.apiId.stringValue),
            let apiHash = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.apiHash.stringValue),
            let accountId = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.accountId.stringValue),
            let usesTestEnvironment = aDecoder.decodeObject(of: NSNumber.self, forKey: CodingKeys.usesTestEnvironment.stringValue) else {
                return nil
        }
       
        self.apiId = apiId.intValue
        self.apiHash = apiHash as String
        self.accountId = accountId as String
        self.usesTestEnvironment = usesTestEnvironment.boolValue
        self.appGroupId = aDecoder.decodeObject(of: NSString.self, forKey: CodingKeys.appGroupId.stringValue) as String?
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(apiId, forKey: CodingKeys.apiId.stringValue)
        aCoder.encode(apiHash, forKey: CodingKeys.apiHash.stringValue)
        aCoder.encode(accountId, forKey: CodingKeys.accountId.stringValue)
        aCoder.encode(usesTestEnvironment, forKey: CodingKeys.usesTestEnvironment.stringValue)
        aCoder.encode(appGroupId, forKey: CodingKeys.appGroupId.stringValue)
    }
    
    var tdlibParameters: TDObject.TdlibParameters {
        return .init(useTestDc: usesTestEnvironment,
                     databaseDirectory: <#T##String#>,
                     filesDirectory: <#T##String#>,
                     useFileDatabase: <#T##Bool#>,
                     useChatInfoDatabase: <#T##Bool#>,
                     useMessageDatabase: <#T##Bool#>,
                     useSecretChats: <#T##Bool#>,
                     apiId: apiId,
                     apiHash: apiHash,
                     systemLanguageCode: <#T##String#>,
                     deviceModel: <#T##String#>,
                     systemVersion: <#T##String#>,
                     applicationVersion: <#T##String#>,
                     enableStorageOptimizer: <#T##Bool#>,
                     ignoreFileNames: <#T##Bool#>)
    }

}
