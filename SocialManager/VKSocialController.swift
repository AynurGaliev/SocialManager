//
//  VKViewController.swift
//  SocialManager
//
//  Created by Aynur Galiev on 29.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class VKSocialController: BaseSocialViewController {

    private var network: VKSocialNetwork = VKSocialNetwork.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.login { [weak self] (success) -> Void in
            
            self?.network.GET_POSTS(ClassConstants.postsCount, successBlock: {(posts: [Post]?) -> Void in
                
                if let lPosts = posts {
                    self?.posts += lPosts
                    self?.tableView.reloadData()
                }
                
                }, failureBlock: { (error) -> Void in
                    
            })
            
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row == self.posts.count - 4 {
            
            self.network.GET_POSTS(ClassConstants.postsCount, successBlock: { [weak self] (posts: [Post]?) -> Void in
                
                if let lPosts = posts {
                    self?.posts += lPosts
                    self?.tableView.reloadData()
                }
                
            }, failureBlock: { (error) -> Void in
                
            })
            
        }
    }
}
