//
//  AcceptTermsOfService.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Accepts Telegram terms of services

     - ReturnType: `TDObject.Ok`
     */
    struct AcceptTermsOfService: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Ok

        /**
         Terms of service identifier
         */
        public var termsOfServiceId: String

        /**
         Accepts Telegram terms of services

         - Parameter termsOfServiceId: Terms of service identifier
         */
        public init(termsOfServiceId: String) {
            self.termsOfServiceId = termsOfServiceId
        }
    }
}
