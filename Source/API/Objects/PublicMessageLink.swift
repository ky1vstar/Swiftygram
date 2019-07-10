//
//  PublicMessageLink.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Contains a public HTTPS link to a message in a public supergroup or channel
     */
    struct PublicMessageLink: TDObjectProtocol {
        /**
         Message link
         */
        public var link: String

        /**
         HTML-code for embedding the message
         */
        public var html: String

        /**
         Contains a public HTTPS link to a message in a public supergroup or channel

         - Parameter link: Message link
         - Parameter html: HTML-code for embedding the message
         */
        public init(link: String, html: String) {
            self.link = link
            self.html = html
        }
    }
}
