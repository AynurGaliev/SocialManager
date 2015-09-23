//
//  VKSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class VKSocialNetwork: SocialNetwork {
   
    override func login(successBlock: ((success: Bool) -> Void)?) {
        VKSdk.authorize([VK_PER_FRIENDS])
    }
    
    override func logout() {
        VKSdk.forceLogout()
    }
    
    override init() {
        super.init()
        if let plistDict = NSBundle.mainBundle().infoDictionary {
            if let bundleURLsDict = plistDict["CFBundleURLTypes"] as? Array<Dictionary<String, AnyObject>> {
                if let URLNames = bundleURLsDict.first as? [String: AnyObject?] {
                 
                    if let appID = URLNames["CFBundleURLName"] as? String {
                    
                    }
                
                }
            }
        }
    }
    
}
