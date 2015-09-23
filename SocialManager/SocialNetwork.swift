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
    case Twitter  = "Twitter"
    case WhatsApp = "Whatsapp"
    
    var intValue: Int {
        switch self {
            case .FB       : return 0
            case .VK       : return 1
            case .Twitter  : return 2
            case .WhatsApp : return 3
        }
    }
}

class SocialNetwork: NSObject {
   
    internal var type: SocialType!
    internal var appID: String?
    
    override init() {
        super.init()
    }
    
    private convenience init(type: SocialType) {
        self.init()
        self.type = type
    }
    
    func login(successBlock: ((success: Bool) -> Void)?) {
        fatalError("\(__FUNCTION__) not implemented")
    }
    
    func logout() {
        fatalError("\(__FUNCTION__) not implemented")
    }
    
    class func create(type: SocialType) -> SocialNetwork {
        switch type {
            case .FB: return FBSocialNetwork()
            case .VK: return VKSocialNetwork()
            case .Twitter: return TWSocialNetwork()
        }
    }
}
