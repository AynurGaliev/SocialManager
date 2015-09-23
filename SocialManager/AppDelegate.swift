//
//  AppDelegate.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: SocialAppDelegate {

    var window: UIWindow?

    override func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

class SocialAppDelegate: UIResponder, UIApplicationDelegate, VKSdkDelegate {
    
    private let vkAppId: String? = nil
    private let fbAppID: String? = nil
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        SocialManager.sharedManager.setup()
        Twitter.sharedInstance().startWithConsumerKey("yrqatpxiBDKD70xO076X5Bitb", consumerSecret: "wxvX1piY5RZTIglxAkTGVmtd8jAB5lRSSRlsCUP7cEzvWjzlVZ")
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        VKSdk.initializeWithDelegate(self, andAppId: "")
        VKSdk.wakeUpSession()
        println(NSBundle.mainBundle().infoDictionary!["CFBundleURLTypes"]![""])
        return true
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        VKSdk.processOpenURL(url, fromApplication: sourceApplication)
        return true
    }
    
    func vkSdkNeedCaptchaEnter(captchaError: VKError!) {
        
    }
    
    func vkSdkTokenHasExpired(expiredToken: VKAccessToken!) {
        
    }
    
    func vkSdkUserDeniedAccess(authorizationError: VKError!) {
        
    }
    
    func vkSdkShouldPresentViewController(controller: UIViewController!) {
        
    }
    
    func vkSdkReceivedNewToken(newToken: VKAccessToken!) {
        
    }
}
