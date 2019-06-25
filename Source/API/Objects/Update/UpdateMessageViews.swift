//
//  UpdateMessageViews.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     The view count of the message has changed
     */
    struct UpdateMessageViews: TDObject.Update {
        /**
         Chat identifier
         */
        public let chatId: Int64

        /**
         Message identifier
         */
        public let messageId: Int64

        /**
         New value of the view count
         */
        public let views: Int

        /**
         The view count of the message has changed

         - Parameter chatId: Chat identifier
         - Parameter messageId: Message identifier
         - Parameter views: New value of the view count
         */
        public init(chatId: Int64, messageId: Int64, views: Int) {
            self.chatId = chatId
            self.messageId = messageId
            self.views = views
        }

        // MARK: - Decodable

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)

            chatId = try container.decodeInt64(forKey: .init(string: "chatId"))
            messageId = try container.decodeInt64(forKey: .init(string: "messageId"))
            views = try container.decode(Int.self, forKey: .init(string: "views"))
        }

        // MARK: - Encodable

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)

            try container.encodeInt64(chatId, forKey: .init(string: "chatId"))
            try container.encodeInt64(messageId, forKey: .init(string: "messageId"))
            try container.encode(views, forKey: .init(string: "views"))
        }
    }
}
