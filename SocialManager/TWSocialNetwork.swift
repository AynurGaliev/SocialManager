//
//  TWSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit
import TwitterKit

class TWSocialNetwork: NSObject {
   
    struct TWConstants {
        static let kConsumerKey   : String = "Twitter consumer key"
        static let kConsumerSecret: String = "Twitter secret key"
    }
    
    class var sharedInstance: TWSocialNetwork {
        struct Static {
            static var token: dispatch_once_t = dispatch_once_t()
            static var instance: TWSocialNetwork!
        }
        dispatch_once(&Static.token, { () -> Void in
            Static.instance = TWSocialNetwork()
        })
        return Static.instance
    }
    
    private let twitter: Twitter = Twitter.sharedInstance()
    
    class var consumerKey: String {
        if let plistDict = NSBundle.mainBundle().infoDictionary, let lConsumerKey = plistDict[TWConstants.kConsumerKey] as? String {
            return lConsumerKey
        }
        fatalError("\(__FUNCTION__) doesn't exist in .plist file")
    }
    
    class var consumerSecret: String {
        if let plistDict = NSBundle.mainBundle().infoDictionary, let lConsumerSecret = plistDict[TWConstants.kConsumerSecret] as? String {
            return lConsumerSecret
        }
        fatalError("\(__FUNCTION__) doesn't exist in .plist file")
    }
    
    func GET_POSTS(count: Int, successBlock: ((posts: [FSPost]?) -> Void)?, failureBlock: ((error: NSError!) -> Void)?)  {

    }
}

extension TWSocialNetwork: SocialProtocol {
    
    class var appID: String? {
        get {
            println("WARNING: AppID doesn't exist for Twitter")
            return nil
        }
    }
    
    func login(successBlock: ((success: Bool) -> Void)?) {
        self.twitter.logInWithCompletion { (session: TWTRSession?, error: NSError?) -> Void in
            
        }
    }
    
    func logout() {
        self.twitter.logOut()
    }
    
}
