//
//  main.swift
//  TDLibGenerator
//
//  Created by KY1VSTAR on 5/29/19.
//  Copyright © 2019 KY1VSTAR. All rights reserved.
//

import Foundation
import Commander

// MARK: - Constants

let enumNamespace = "TDEnum"
let enumProtocol = "TDEnumProtocol"

let objectNamespace = "TDObject"
let objectProtocol = "TDObjectProtocol"

let functionNamespace = "TDFunction"
let functionProtocol = "TDFunctionProtocol"
let authorizationIndependentFunction = "AuthorizationIndependentFunction"

let anyCodingKey = "AnyCodingKey"
let subclassCodable = "SubclassCodable"

let maxDocsLineLength = 70
let maxPropertyCount = 5
let forceSubclass = ["Update"]
let ignoredClasses = ["TestUseUpdate"]
let returnTypeDocumentation = "Type of return value for this function".multilineComment

let internalTypes = ["TdlibParameters",
                     "SetTdlibParameters",
                     
                     "AuthorizationState",
                     "GetAuthorizationState",
                     "UpdateAuthorizationState",
                     
                     "CheckDatabaseEncryptionKey",
                     "SetDatabaseEncryptionKey",
                     "SetAuthenticationPhoneNumber",
                     "CheckAuthenticationCode",
                     "ResendAuthenticationCode"]

// MARK: - Global

private(set) var typeDecisionsURL = URL(fileURLWithPath: "")
private(set) var outputFolderURL = URL(fileURLWithPath: "")

// MARK: - Main

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

let main = command { (tdApiPath: String, typeDecisionsFolder: String, outputFolder: String) in
    typeDecisionsURL = URL(fileURLWithPath: typeDecisionsFolder)
    outputFolderURL = URL(fileURLWithPath: outputFolder)
    
    try? FileManager.default.removeItem(at: outputFolderURL)
    try FileManager.default.createDirectory(at: outputFolderURL, withIntermediateDirectories: false, attributes: nil)
    
    let source = try String(contentsOfFile: tdApiPath, encoding: .utf8)

    let container = TLContainer.parse(source: source)
    
    Generator(container: container).generate()
    
    TypeDecider.save()
    
    let headers = [
        "",
        "{file}",
        "Swiftygram",
        "Created by ky1vstar on {created}.",
        "Copyright © {year} ky1vstar. All rights reserved.",
        ""
    ].joined(separator: "\\n ")
    
    shell("/usr/local/bin/swiftformat",
          outputFolder,
          "--swiftversion", "5",
          "--header", headers)
}

main.run()
