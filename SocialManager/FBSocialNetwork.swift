//
//  FBSocialNetwork.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class FBSocialNetwork: SocialNetwork {
   
    private let manager: FBSDKLoginManager = FBSDKLoginManager()
    private var loginResult: FBSDKLoginManagerLoginResult!
    private var requestBuilder: FBRequestBuilder!
    override var type: SocialType { return .FB }
    
    override class var appID: String {
        if let bundleURLsDict = NSBundle.mainBundle().infoDictionary?["CFBundleURLTypes"] as? Array<Dictionary<String, AnyObject>> {
            if let dict = bundleURLsDict.first, let appIDs = dict["CFBundleURLSchemes"] as? [String] {
                return appIDs.first!.substringFromIndex(advance(appIDs.first!.startIndex, 2))
            }
        }
        fatalError("Error in \(__FILE__)(line \(__LINE__)): appID doesn't exist in .plist file")
    }

    override func login(successBlock: ((success: Bool) -> Void)?) {
        self.manager.logInWithReadPermissions(["public_profile"], fromViewController: nil) { [weak self] ( result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            self?.loginResult = result
            successBlock?(success: error == nil)
        }
    }
    
    override func logout() {
        self.manager.logOut()
    }
    
    func createBuilder() -> FBRequestBuilder {
        self.requestBuilder = FBRequestBuilder.create()
        return self.requestBuilder
    }
}

class FBRequestBuilder: RequestBuilder  {
    
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
    
    class func create() -> FBRequestBuilder {
        return FBRequestBuilder()
    }
    
    var POST: FBRequestBuilder {
        self.HTTPMethod = HttpMethod.POST.rawValue
        return self as FBRequestBuilder
    }
    
    var GET: FBRequestBuilder {
        self.HTTPMethod = HttpMethod.GET.rawValue
        return self
    }
    
    var DELETE: FBRequestBuilder {
        self.HTTPMethod = HttpMethod.DELETE.rawValue
        return self
    }
    
    var Posts: FBRequestBuilder {
        self.method = "me/posts"
        return self
    }
    
    func startRequest(params: [String : AnyObject], successBlock: ((response: [String : AnyObject], connection: FBSDKGraphRequestConnection!) -> Void)?, failureBlock: ((error: NSError) -> Void)?) -> FBSDKGraphRequestConnection {
        let request = FBSDKGraphRequest(graphPath: self.method, parameters: params, HTTPMethod: self.HTTPMethod)
        return request.startWithCompletionHandler({ (connection: FBSDKGraphRequestConnection!, response: AnyObject!, error: NSError!) -> Void in
            
            if let lResponse = response as? [String : AnyObject] where error == nil {
                successBlock?(response: lResponse, connection: connection)
            } else {
                failureBlock?(error: error)
            }
        })
    }
}