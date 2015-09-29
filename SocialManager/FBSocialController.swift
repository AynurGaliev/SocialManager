//
//  FBSocialController.swift
//  SocialManager
//
//  Created by Aynur Galiev on 29.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class FBSocialController: BaseSocialViewController {
    
    private var network: FBSocialNetwork = FBSocialNetwork.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.network.GET_POSTS(ClassConstants.postsCount, successBlock: { [weak self] (posts: [FSPost]?) -> Void in
            
            if let lPosts = posts {
                self?.posts += lPosts
                self?.tableView.reloadData()
            }
            
            }, failureBlock: { (error) -> Void in
                
        })
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row == self.posts.count - 4 {
            
            self.network.GET_POSTS(ClassConstants.postsCount, successBlock: { [weak self] (posts: [FSPost]?) -> Void in
                
                if let lPosts = posts {
                    self?.posts += lPosts
                    self?.tableView.reloadData()
                }
                
                }, failureBlock: { (error) -> Void in
                    
            })
            
        }
    }
}
