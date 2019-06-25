//
//  GetSavedAnimations.swift
//  Swiftygram
//  Created by ky1vstar on 6/25/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns saved animations

     - ReturnType: `TDObject.Animations`
     */
    struct GetSavedAnimations: TDFunctionProtocol {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Animations

        /**
         Returns saved animations
         */
        public init() {}
    }
}
