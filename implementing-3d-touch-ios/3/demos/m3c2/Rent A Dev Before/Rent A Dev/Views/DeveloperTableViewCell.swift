//
//  DeveloperTableViewCell.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 8/12/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import UIKit

class DeveloperTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var expertiseLabel: UILabel!
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        avatarImageView.contentMode = UIViewContentMode.scaleAspectFit
        avatarImageView.clipsToBounds = true
    }
    
    func bindData(with developer:Developer)
    {
        avatarImageView.image = developer.avatarImg
        nameLabel.text = developer.name
        expertiseLabel.text = developer.expertise
    }

}
