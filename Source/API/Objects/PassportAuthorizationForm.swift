//
//  PassportAuthorizationForm.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains information about a Telegram Passport authorization form that was requested
     */
    struct PassportAuthorizationForm: TDObjectProtocol {
        /**
         Unique identifier of the authorization form
         */
        public let id: Int

        /**
         Information about the Telegram Passport elements that need to be provided to complete the form
         */
        public let requiredElements: [TDObject.PassportRequiredElement]

        /**
         URL for the privacy policy of the service; may be empty
         */
        public let privacyPolicyUrl: String

        /**
         Contains information about a Telegram Passport authorization form that was requested

         - Parameter id: Unique identifier of the authorization form
         - Parameter requiredElements: Information about the Telegram Passport elements that need to be provided to complete the form
         - Parameter privacyPolicyUrl: URL for the privacy policy of the service; may be empty
         */
        public init(id: Int, requiredElements: [TDObject.PassportRequiredElement], privacyPolicyUrl: String) {
            self.id = id
            self.requiredElements = requiredElements
            self.privacyPolicyUrl = privacyPolicyUrl
        }
    }
}
