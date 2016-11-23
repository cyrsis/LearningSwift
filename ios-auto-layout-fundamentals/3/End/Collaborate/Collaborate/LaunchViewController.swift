//
//  LaunchViewController.swift
//  Collaborate
//
//  Created by Pluralsight on 10/20/15.
//  Copyright © 2015 Pluralsight. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImageView(image: UIImage(named: "Logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logo)
        
        let centerX = NSLayoutConstraint(
            item: logo,
            attribute: .CenterX,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .CenterX,
            multiplier: 1,
            constant: 0
        )
        
        let centerY = NSLayoutConstraint(
            item: logo,
            attribute: .CenterY,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .CenterY,
            multiplier: 1,
            constant: 0
        )
        
        let imageSize = logo.image!.size
        let aspectRatio = NSLayoutConstraint(
            item: logo,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: self.view,
            attribute: .Height,
            multiplier: imageSize.width / imageSize.height,
            constant: 1
        )
        
        let top = NSLayoutConstraint(
            item: logo,
            attribute: .Top,
            relatedBy: .GreaterThanOrEqual,
            toItem: self.view,
            attribute: .TopMargin,
            multiplier: 1,
            constant: 20
        )
        
        let bottom = NSLayoutConstraint(
            item: logo,
            attribute: .Bottom,
            relatedBy: .GreaterThanOrEqual,
            toItem: self.view,
            attribute: .BottomMargin,
            multiplier: 1,
            constant: 20
        )
        
        let leading = NSLayoutConstraint(
            item: logo,
            attribute: .Leading,
            relatedBy: .GreaterThanOrEqual,
            toItem: self.view,
            attribute: .LeadingMargin,
            multiplier: 1,
            constant: 0
        )
        
        let trailing = NSLayoutConstraint(
            item: logo,
            attribute: .Trailing,
            relatedBy: .GreaterThanOrEqual,
            toItem: self.view,
            attribute: .TrailingMargin,
            multiplier: 1,
            constant: 0
        )
        
        logo.addConstraint(aspectRatio)
        self.view.addConstraints([centerX, centerY, top, bottom, leading, trailing])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
