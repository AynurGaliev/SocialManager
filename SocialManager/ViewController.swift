//
//  ViewController.swift
//  SocialManager
//
//  Created by Aynur Galiev on 23.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SocialManager.VK?.login({ (success) -> Void in
            let builder = SocialManager.VK?.createBuilder()
            builder?.Posts.GET.startRequest([:], successBlock: { (response) -> Void in
                
            }, failureBlock: { (error) -> Void in
                
            })
        })
    }
}

