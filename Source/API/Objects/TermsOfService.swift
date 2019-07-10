//
//  TermsOfService.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains Telegram terms of service
     */
    struct TermsOfService: TDObjectProtocol {
        /**
         Text of the terms of service
         */
        public var text: TDObject.FormattedText

        /**
         Mininum age of a user to be able to accept the terms; 0 if any
         */
        public var minUserAge: Int

        /**
         True, if a blocking popup with terms of service must be shown to the user
         */
        public var showPopup: Bool

        /**
         Contains Telegram terms of service

         - Parameter text: Text of the terms of service
         - Parameter minUserAge: Mininum age of a user to be able to accept the terms; 0 if any
         - Parameter showPopup: True, if a blocking popup with terms of service must be shown to the user
         */
        public init(text: TDObject.FormattedText, minUserAge: Int, showPopup: Bool) {
            self.text = text
            self.minUserAge = minUserAge
            self.showPopup = showPopup
        }
    }
}
