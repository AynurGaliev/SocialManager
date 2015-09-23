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
    
    override convenience init() {
        self.init(type: SocialType.FB)
    }
    
    override func login(successBlock: ((success: Bool) -> Void)?) {
        self.manager.logInWithReadPermissions(["public_profile"], fromViewController: nil) { [weak self] ( result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            self?.loginResult = result
        }
    }
    
    override func logout() {
        self.manager.logOut()
    }
    
}
