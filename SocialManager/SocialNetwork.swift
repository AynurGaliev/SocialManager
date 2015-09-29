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
    
    init(intValue: Int) {
        switch intValue {
            case 0: self = .VK
            case 1: self = .FB
            case 2: self = .TW
            default: self = .Undefined
        }
    }
    
    var intValue: Int {
        switch self {
            case .FB        : return 0
            case .VK        : return 1
            case .TW        : return 2
            case .WhatsApp  : return 3
            case .Undefined : return -1
        }
    }
    
    var network: NSObject {
        switch self {
        case .FB        : return FBSocialNetwork.sharedInstance
        case .VK        : return VKSocialNetwork.sharedInstance
        case .TW        : return TWSocialNetwork.sharedInstance
        case .WhatsApp  : return NSObject()
        case .Undefined : return NSObject()
        }
    }
}

protocol SocialProtocol: NSObjectProtocol {
    func logout()
    func login(successBlock: SuccessBlock)
    static var appID: String? {get}
}