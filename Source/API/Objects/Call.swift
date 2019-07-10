//
//  Call.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Describes a call
     */
    struct Call: TDObjectProtocol {
        /**
         Call identifier, not persistent
         */
        public var id: Int

        /**
         Peer user identifier
         */
        public var userId: Int

        /**
         True, if the call is outgoing
         */
        public var isOutgoing: Bool

        /**
         Call state
         */
        public var state: TDEnum.CallState

        /**
         Describes a call

         - Parameter id: Call identifier, not persistent
         - Parameter userId: Peer user identifier
         - Parameter isOutgoing: True, if the call is outgoing
         - Parameter state: Call state
         */
        public init(id: Int, userId: Int, isOutgoing: Bool, state: TDEnum.CallState) {
            self.id = id
            self.userId = userId
            self.isOutgoing = isOutgoing
            self.state = state
        }
    }
}
