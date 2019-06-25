//
//  UpdateCall.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     New call was created or information about a call was updated
     */
    struct UpdateCall: TDObject.Update {
        /**
         New data about a call
         */
        public let call: TDObject.Call

        /**
         New call was created or information about a call was updated

         - Parameter call: New data about a call
         */
        public init(call: TDObject.Call) {
            self.call = call
        }
    }
}
