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

class SocialManager: NSObject {
   
    private var networks: Set<SocialNetwork>!
    
    class var sharedManager: SocialManager {
        struct Static {
            static var token: dispatch_once_t!
            static var instance: SocialManager!
        }
        dispatch_once(&Static.token!, { () -> Void in
            Static.instance = SocialManager()
        })
        return Static.instance
    }
    
    func setNetworks(socialNetworks: Set<SocialNetwork>) {
        self.networks = socialNetworks
    }
    
    func removeNetwork(types: [SocialType]) {
        for network in self.networks {
            if contains(types, network.type) {
                self.networks.remove(network)
            }
        }
    }
    
    func setup(types: Set<SocialType>) {
        for type in types {
            self.networks.insert(SocialNetwork.create(type))
        }
    }
    
    func login(types: Set<SocialType>? = nil, delay: Double, completionBlock: LoginSuccessBlock) {
        
        let semaphore: dispatch_semaphore_t = dispatch_semaphore_create(1)
        
        if let lTypes = types {
            for network: SocialNetwork in self.networks {
                if lTypes.contains(network.type) {
                    network.login({ (success) -> Void in
                        dispatch_semaphore_signal(semaphore)
                    })
                    completionBlock?(type: network.type, success: (dispatch_semaphore_wait(semaphore, delay.time) == 0) )
                }
            }
        }
    }
    
    func logout() {
        for network in self.networks {
            network.logout()
        }
    }
    
    func network(type: SocialType) -> SocialNetwork? {
        return filter(self.networks){$0.type == type}.first
    }
    
    class func getAppID(type: SocialType) -> String {
        return ""
    }
}

extension Double {
    
    var time: dispatch_time_t {
        return dispatch_time(DISPATCH_TIME_NOW, Int64(self * Double(NSEC_PER_SEC)))
    }
}