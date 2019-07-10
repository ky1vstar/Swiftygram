//
//  GetConnectedWebsites.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all website where the current user used Telegram to log in

     - ReturnType: `TDObject.ConnectedWebsites`
     */
    struct GetConnectedWebsites: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.ConnectedWebsites

        /**
         Returns all website where the current user used Telegram to log in
         */
        public init() {}
    }
}
