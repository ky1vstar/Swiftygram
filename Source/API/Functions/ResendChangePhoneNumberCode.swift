//
//  ResendChangePhoneNumberCode.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null

     - ReturnType: `TDObject.AuthenticationCodeInfo`
     */
    struct ResendChangePhoneNumberCode: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.AuthenticationCodeInfo

        /**
         Re-sends the authentication code sent to confirm a new phone number for the user. Works only if the previously received authenticationCodeInfo next_code_type was not null
         */
        public init() {}
    }
}
