//
//  VKSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class VKSocialNetwork: SocialNetwork {
   
    private var permissions: [String]?
    private var requestBuilder: VKRequestBuilder!
    
    override var type: SocialType { return .VK }
    override class var appID: String {
        if let plistDict = NSBundle.mainBundle().infoDictionary {
            if let bundleURLsDict = plistDict["CFBundleURLTypes"] as? Array<Dictionary<String, AnyObject>> {
                if let dict = bundleURLsDict.first, let appID = dict["CFBundleURLName"] as? String {
                    return appID.substringFromIndex(advance(appID.startIndex, 2))
                }
            }
        }
        fatalError("Error in \(__FILE__)(line \(__LINE__)): appID doesn't exist in .plist file")
    }
    
    override func login(successBlock: ((success: Bool) -> Void)?) {
        VKSdk.authorize([VK_PER_FRIENDS])
    }
    
    override func logout() {
        VKSdk.forceLogout()
    }
    
    func createBuilder() -> VKRequestBuilder {
        self.requestBuilder = VKRequestBuilder.create()
        return self.requestBuilder
    }
}

class VKRequestBuilder: RequestBuilder  {
    
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
    
    class func create() -> VKRequestBuilder {
        return VKRequestBuilder()
    }
    
    var POST: VKRequestBuilder {
        self.HTTPMethod = HttpMethod.POST.rawValue
        return self as VKRequestBuilder
    }
    
    var GET: VKRequestBuilder {
        self.HTTPMethod = HttpMethod.GET.rawValue
        return self
    }
    
    var DELETE: VKRequestBuilder {
        self.HTTPMethod = HttpMethod.DELETE.rawValue
        return self
    }
    
    var Posts: VKRequestBuilder {
        self.method = "posts.get"
        return self
    }
    
    func startRequest(params: [String : AnyObject], successBlock: ((response: VKResponse!) -> Void)?, failureBlock: ((error: NSError!) -> Void)?) {
        let request = VKRequest(method: self.method, andParameters: params, andHttpMethod: self.HTTPMethod)
        request.executeWithResultBlock({ (response: VKResponse!) -> Void in
            successBlock?(response: response)
        }, errorBlock: { (error: NSError!) -> Void in
            failureBlock?(error: error)
        })
    }
}