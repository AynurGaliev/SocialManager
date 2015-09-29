//
//  PostCell.swift
//  SocialManager
//
//  Created by Aynur Galiev on 29.09.15.
//  Copyright (c) 2015 Flatstack. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var isOnlineLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var postTextToOnlineConstraint: NSLayoutConstraint!
    var post: Post!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let lPost = post where lPost.isOnline {
            self.postTextToOnlineConstraint.constant = 10
        } else {
            self.postTextToOnlineConstraint.constant = 5
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.avatarImageView.sd_cancelCurrentImageLoad()
        self.firstNameLabel.text = nil
        self.lastNameLabel.text = nil
        self.isOnlineLabel.text = nil
        self.postTextLabel.text = nil
        self.likesLabel.text = nil
    }
    
    func prepareCell(post: Post) {
        self.avatarImageView.sd_setImageWithURL(self.post.avatarURL)
    }
}
