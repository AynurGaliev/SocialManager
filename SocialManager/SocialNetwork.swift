//
//  SocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

enum SocialType: String {
    case FB       = "Facebook"
    case VK       = "Vkontakte"
    case TW       = "Twitter"
    case WhatsApp = "Whatsapp"
    case Undefined = ""
    
    var intValue: Int {
        switch self {
            case .FB        : return 0
            case .VK        : return 1
            case .TW        : return 2
            case .WhatsApp  : return 3
            case .Undefined : return -1
        }
    }
    
    var networkClass: AnyClass {
        switch self {
            case .FB        : return FBSocialNetwork.self
            case .VK        : return VKSocialNetwork.self
            case .TW        : return TWSocialNetwork.self
            case .WhatsApp  : return NSObject.self
            case .Undefined : return NSObject.self
        }
    }
}

class SocialNetwork: NSObject {
   
    var type          : SocialType { return .Undefined }
    class var appID   : String { fatalError("\(__FUNCTION__) not implemented")}
    
    override init() {
        super.init()
    }
    
    func login(successBlock: ((success: Bool) -> Void)?) {
        fatalError("\(__FUNCTION__) not implemented")
    }
    
    func logout() {
        fatalError("\(__FUNCTION__) not implemented")
    }
    
    class func create(type: SocialType) -> SocialNetwork {
        switch type {
            case .FB : return FBSocialNetwork()
            case .VK : return VKSocialNetwork()
            case .TW : return TWSocialNetwork()
            default  : return SocialNetwork()
        }
    }
}

class RequestBuilder {
    
    var _HTTPMethod : String!
    var _method     : String!
    var _apiVersion : String!

}