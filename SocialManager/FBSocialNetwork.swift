//
//  FBSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class FBSocialNetwork: NSObject {
   
    private let manager: FBSDKLoginManager = FBSDKLoginManager()
    private var loginResult: FBSDKLoginManagerLoginResult!
    
    class var sharedInstance: FBSocialNetwork {
        struct Static {
            static var token: dispatch_once_t = dispatch_once_t()
            static var instance: FBSocialNetwork!
        }
        dispatch_once(&Static.token, { () -> Void in
            Static.instance = FBSocialNetwork()
        })
        return Static.instance
    }
    
    func GET_POSTS(count: Int, successBlock: ((posts: [FSPost]?) -> Void)?, failureBlock: ((error: NSError!) -> Void)?) -> FBSDKGraphRequestConnection {
                
        let request = FBSDKGraphRequest(graphPath: "me/posts", parameters: ["":1], HTTPMethod: HttpMethod.GET.rawValue)
                
        return request.startWithCompletionHandler({ (connection: FBSDKGraphRequestConnection!, response: AnyObject!, error: NSError!) -> Void in
            
            if let lResponse = response as? [String : AnyObject] where error == nil {
                //successBlock?(response: lResponse, connection: connection)
            } else {
                failureBlock?(error: error)
            }
        })
    }
    
    func POST_POSTS(params: [String : AnyObject],
        successBlock: ((response: [String : AnyObject],
        connection: FBSDKGraphRequestConnection!) -> Void)?,
        failureBlock: ((error: NSError) -> Void)?) -> FBSDKGraphRequestConnection {
            
            let request = FBSDKGraphRequest(graphPath: "me/posts", parameters: params, HTTPMethod: HttpMethod.GET.rawValue)
            
            return request.startWithCompletionHandler({ (connection: FBSDKGraphRequestConnection!, response: AnyObject!, error: NSError!) -> Void in
                
                if let lResponse = response as? [String : AnyObject] where error == nil {
                    successBlock?(response: lResponse, connection: connection)
                } else {
                    failureBlock?(error: error)
                }
            })
    }
    
}

extension FBSocialNetwork: SocialProtocol {
    
    func login(successBlock: ((success: Bool) -> Void)?) {
        self.manager.logInWithReadPermissions(["public_profile"], fromViewController: nil) { [weak self] ( result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            self?.loginResult = result
            successBlock?(success: error == nil)
        }
    }
    
    func logout() {
        self.manager.logOut()
    }
    
    class var appID: String? {
        
        get {
            if let bundleURLsDict = NSBundle.mainBundle().infoDictionary?["CFBundleURLTypes"] as? Array<Dictionary<String, AnyObject>> {
                if let dict = bundleURLsDict.first, let appIDs = dict["CFBundleURLSchemes"] as? [String] {
                    return appIDs.first!.substringFromIndex(advance(appIDs.first!.startIndex, 2))
                }
            }
            fatalError("Error in \(__FILE__)(line \(__LINE__)): appID doesn't exist in .plist file")
        }
    }
}