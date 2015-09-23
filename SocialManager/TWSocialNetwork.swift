//
//  TWSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit
import TwitterKit

class TWSocialNetwork: SocialNetwork {
   
    struct TWConstants {
        static let kConsumerKey   : String = "Twitter consumer key"
        static let kConsumerSecret: String = "Twitter secret key"
    }
    
    private let twitter: Twitter = Twitter.sharedInstance()
    
    var consumerKey   : String?
    var consumerSecret: String?
    
    convenience override init() {
        self.init()
        if let plistDict = NSBundle.mainBundle().infoDictionary {
            if let lConsumerKey = plistDict[TWConstants.kConsumerKey] as? String {
                self.consumerKey = lConsumerKey
            }
            if let lSecretKey = plistDict[TWConstants.kConsumerSecret] as? String {
                self.consumerSecret = lSecretKey
            }
        }
    }
    
    override func login(successBlock: ((success: Bool) -> Void)?) {
        self.twitter.logInWithCompletion { (session: TWTRSession?, error: NSError?) -> Void in
            
        }
    }
    
    override func logout() {
        self.twitter.logOut()
    }
}
