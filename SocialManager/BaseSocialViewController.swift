//
//  BaseSocialViewController.swift
//  SocialManager
//
//  Created by Aynur Galiev on 29.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class BaseSocialViewController: UITableViewController {

    struct ClassConstants {
        static let CellIdentifier = "PostCell"
        static let LoadingCellIdentifier = "LoadingCell"
        static let postsCount = 10
    }
    
    var _posts: [Post] = []
    
    internal var posts: [Post] {
        get {
            return self._posts
        }
        set {
            self._posts = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        self.tableView.registerClass(PostCell.self, forCellReuseIdentifier: ClassConstants.CellIdentifier)
        self.tableView.registerClass(LoadingCell.self, forCellReuseIdentifier: ClassConstants.LoadingCellIdentifier)
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.posts.count
        }
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(ClassConstants.CellIdentifier) as! PostCell
            cell.prepareCell(posts[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(ClassConstants.LoadingCellIdentifier) as! LoadingCell
            return cell
        }
    }

}
