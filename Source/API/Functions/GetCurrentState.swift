//
//  GetCurrentState.swift
//  Swiftygram
//  Created by ky1vstar on 7/10/19.
//  Copyright © 2019 ky1vstar. All rights reserved.
//

public extension TDFunction {
    /**
     Returns all updates needed to restore current TDLib state, i.e. all actual UpdateAuthorizationState/UpdateUser/UpdateNewChat and others. This is especially usefull if TDLib is run in a separate process. This is an offline method. Can be called before authorization

     - ReturnType: `TDObject.Updates`
     */
    struct GetCurrentState: TDFunctionProtocol, AuthorizationIndependentFunction {
        /**
         Type of return value for this function
         */
        public typealias ReturnType = TDObject.Updates

        /**
         Returns all updates needed to restore current TDLib state, i.e. all actual UpdateAuthorizationState/UpdateUser/UpdateNewChat and others. This is especially usefull if TDLib is run in a separate process. This is an offline method. Can be called before authorization
         */
        public init() {}
    }
}
