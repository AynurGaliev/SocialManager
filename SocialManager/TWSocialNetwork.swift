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
    private var requestBuilder: TWRequestBuilder!
    
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
    
    override class var appID: String {
        println("WARNING: AppID doesn't exist for Twitter")
        return ""
    }
    
    override var type: SocialType {
        return .TW
    }
    
    override func login(successBlock: ((success: Bool) -> Void)?) {
        self.twitter.logInWithCompletion { (session: TWTRSession?, error: NSError?) -> Void in
            
        }
    }
    
    override func logout() {
        self.twitter.logOut()
    }
    
    func createBuilder() -> TWRequestBuilder {
        self.requestBuilder = TWRequestBuilder.create()
        return self.requestBuilder
    }
}

class TWRequestBuilder: RequestBuilder  {
    
    private var apiVersion: String {
        get { return _apiVersion }
        set { self._apiVersion = newValue }
    }
    
    private var method: String {
        get { return _method }
        set { self._method = newValue }
    }
    
    private var HTTPMethod: String {
        get { return _HTTPMethod }
        set { self._HTTPMethod = newValue }
    }
    
    class func create() -> TWRequestBuilder {
        return TWRequestBuilder()
    }
    
    var POST: TWRequestBuilder {
        self.HTTPMethod = HttpMethod.POST.rawValue
        return self
    }
    
    var GET: TWRequestBuilder {
        self.HTTPMethod = HttpMethod.GET.rawValue
        return self
    }
    
    var DELETE: TWRequestBuilder {
        self.HTTPMethod = HttpMethod.DELETE.rawValue
        return self
    }
    
    var Posts: TWRequestBuilder {
        self.method = "posts.get"
        return self
    }
    
    func startRequest(params: [String : AnyObject], successBlock: ((response: VKResponse!) -> Void)?, failureBlock: ((error: NSError!) -> Void)?) {
        let request = Twitter.sharedInstance().APIClient
    }
}