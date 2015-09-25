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
   
    private static var networks: Set<SocialNetwork>! = Set<SocialNetwork>()
    
    class var VK: VKSocialNetwork? { return SocialManager.network(.VK) as? VKSocialNetwork }
    class var FB: FBSocialNetwork? { return SocialManager.network(.FB) as? FBSocialNetwork }
    class var TW: TWSocialNetwork? { return SocialManager.network(.TW) as? TWSocialNetwork }
    
    func setNetworks(socialNetworks: Set<SocialNetwork>) {
        SocialManager.networks = socialNetworks
    }
    
    func removeNetwork(types: [SocialType]) {
        
    }
    
    class func setup(types: Set<SocialType>) {
        for type in types {
            SocialManager.networks.insert(SocialNetwork.create(type))
        }
    }
    
    func logout() {
        for network in SocialManager.networks {
            network.logout()
        }
    }
    
    private class func network(type: SocialType) -> SocialNetwork? {
        return filter(SocialManager.networks, { (network: SocialNetwork) -> Bool in
            return network.type == type
        }).first
    }
}

extension Double {
    
    var time: dispatch_time_t {
        return dispatch_time(DISPATCH_TIME_NOW, Int64(self * Double(NSEC_PER_SEC)))
    }
}