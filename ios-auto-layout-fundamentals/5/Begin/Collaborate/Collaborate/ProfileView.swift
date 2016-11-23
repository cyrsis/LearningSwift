//
//  ProfileView.swift
//  Collaborate
//
//  Created by Pluralsight on 10/21/15.
//  Copyright © 2015 Pluralsight. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileView: UIView {
    
    var profileImageView: UIImageView!
    var networkImageView: UIImageView!
    
    @IBInspectable var profileImage: UIImage? {
        didSet {
            profileImageView.image = profileImage
        }
    }
    
    @IBInspectable var networkImage: UIImage? {
        didSet {
            networkImageView.image = networkImage
        }
    }
    
    var profileTopConstraint: NSLayoutConstraint!
    
    var networkLeadingConstraint: NSLayoutConstraint!
    var networkBottomConstraint: NSLayoutConstraint!
    var networkTrailingConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeViews()
    }
    
    class override func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    private func initializeViews() {
        self.backgroundColor = UIColor.lightGrayColor()
        self.profileImageView = UIImageView(frame: CGRectZero)
        self.profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.profileImageView)
        
        
        self.profileTopConstraint = NSLayoutConstraint(
            item: self.profileImageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 0
        )
        
        let profileLeading = NSLayoutConstraint(
            item: self.profileImageView,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Leading,
            multiplier: 1,
            constant: 0
        )
        
        self.addConstraints([self.profileTopConstraint, profileLeading])
        
        self.networkImageView = UIImageView(frame: CGRectZero)
        self.networkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.networkImageView)
        
        let networkTop = NSLayoutConstraint(
            item: self.networkImageView,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 0
        )
        
        self.networkTrailingConstraint = NSLayoutConstraint(
            item: self.networkImageView,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: self.profileImageView,
            attribute: .Trailing,
            multiplier: 1,
            constant: 0
        )
        
        self.networkBottomConstraint = NSLayoutConstraint(
            item: self.networkImageView,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1,
            constant: 0
        )
        
        self.networkLeadingConstraint = NSLayoutConstraint(
            item: self.networkImageView,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Leading,
            multiplier: 1,
            constant: 0
        )
        
        self.addConstraints([networkTop, self.networkBottomConstraint, self.networkLeadingConstraint, self.networkTrailingConstraint])
    }
    
        
}
