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
        
        self.profileTopConstraint = self.profileImageView.topAnchor.constraintEqualToAnchor(self.topAnchor)
        self.profileTopConstraint.active = true
        
        self.profileImageView.topAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        
        self.networkImageView = UIImageView(frame: CGRectZero)
        self.networkImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.networkImageView)

        self.networkImageView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        
        self.networkTrailingConstraint = self.networkImageView.trailingAnchor.constraintEqualToAnchor(self.profileImageView.trailingAnchor)
        self.networkTrailingConstraint.active = true
        
        self.networkBottomConstraint = self.networkImageView.bottomAnchor.constraintEqualToAnchor(self.topAnchor)
        self.networkBottomConstraint.active = true
        
        self.networkLeadingConstraint = self.networkImageView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor)
        self.networkLeadingConstraint.active = true
    }
    
    override func updateConstraints() {
        if let pImage = self.profileImage, nImage = self.networkImage {
            let leadingDistance = pImage.size.width * 0.65
            self.networkLeadingConstraint.constant = leadingDistance
            self.networkBottomConstraint.constant = pImage.size.height * 0.35
            
            self.profileTopConstraint.constant = nImage.size.height * 0.25
            
            let maxDistance = (leadingDistance + nImage.size.width) - pImage.size.width
            
            self.networkTrailingConstraint.constant = maxDistance
        }
        
        super.updateConstraints()
    }
    
    override func intrinsicContentSize() -> CGSize {
        if let pImage = self.profileImage {
            return pImage.size
        } else {
            return CGSize(width: UIViewNoIntrinsicMetric, height: UIViewNoIntrinsicMetric)
        }
    }
    
    override func alignmentRectInsets() -> UIEdgeInsets {
        let maxX = self.networkTrailingConstraint.constant > 0 ? self.networkTrailingConstraint.constant : 0
        
        return UIEdgeInsets(top: 0, left: 0, bottom: self.profileTopConstraint.constant, right: maxX)
    }
    
//    override func viewForBaselineLayout() -> UIView {
//        return self.networkImageView
//    }
}
