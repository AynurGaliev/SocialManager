//
//  SocialManager.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

typealias SuccessBlock = ((success: Bool) -> Void)?
typealias LoginSuccessBlock = ((type: SocialType, success: Bool) -> Void)?

enum HttpMethod: String {
    case GET  = "GET"
    case POST = "POST"
    case DELETE = "DELETE"
}

class SocialManager: NSObject {
   
}

extension Double {
    
    var time: dispatch_time_t {
        return dispatch_time(DISPATCH_TIME_NOW, Int64(self * Double(NSEC_PER_SEC)))
    }
}