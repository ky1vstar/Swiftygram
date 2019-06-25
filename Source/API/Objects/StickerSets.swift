//
//  StickerSets.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDObject {
    /**
     Represents a list of sticker sets
     */
    struct StickerSets: TDObjectProtocol {
        /**
         Approximate total number of sticker sets found
         */
        public let totalCount: Int

        /**
         List of sticker sets
         */
        public let sets: [TDObject.StickerSetInfo]

        /**
         Represents a list of sticker sets

         - Parameter totalCount: Approximate total number of sticker sets found
         - Parameter sets: List of sticker sets
         */
        public init(totalCount: Int, sets: [TDObject.StickerSetInfo]) {
            self.totalCount = totalCount
            self.sets = sets
        }
    }
}
