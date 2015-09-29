//
//  VKSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class VKSocialNetwork: NSObject {
   
    private var permissions: [String]?
    
    class var sharedInstance: VKSocialNetwork {
        struct Static {
            static var token: dispatch_once_t = dispatch_once_t()
            static var instance: VKSocialNetwork!
        }
        dispatch_once(&Static.token, { () -> Void in
            Static.instance = VKSocialNetwork()
        })
        return Static.instance
    }

    
    func GET_POSTS(count: Int, successBlock: ((posts: [Post]?) -> Void)?, failureBlock: ((error: NSError!) -> Void)?) {
        
        let request = VKRequest(method: "newsfeed.get", andParameters: ["count" : count], andHttpMethod: HttpMethod.GET.rawValue)
        request.executeWithResultBlock({ (response: VKResponse!) -> Void in
            
            
            
        }, errorBlock: { (error: NSError!) -> Void in
            failureBlock?(error: error)
        })
    }
}

extension VKSocialNetwork: SocialProtocol {
    
    func logout() {
        VKSdk.forceLogout()
    }
    
    func login(successBlock: SuccessBlock) {
        VKSdk.authorize([VK_PER_FRIENDS, VK_PER_WALL])
        successBlock?(success: true)
    }
    
    class var appID: String? {
        get {
            if let plistDict = NSBundle.mainBundle().infoDictionary {
                if let bundleURLsDict = plistDict["CFBundleURLTypes"] as? Array<Dictionary<String, AnyObject>> {
                    if let dict = bundleURLsDict.first, let appID = dict["CFBundleURLName"] as? String {
                        return appID.substringFromIndex(advance(appID.startIndex, 2))
                    }
                }
            }
            fatalError("Error in \(__FILE__)(line \(__LINE__)): appID doesn't exist in .plist file")
        }
    }
}