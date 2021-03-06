//
//  ExperiseBubbleView.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 8/22/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import UIKit

@IBDesignable
class ExperiseBubbleView: UIView
{
    //MARK: Properties
    @IBInspectable let expertiseLabel = UILabel()
    let bubbleBackgroundColor = UIColor(colorLiteralRed: 42/255, green: 145/255, blue: 250/255, alpha: 1)
    
    //MARK: Initializers
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        backgroundColor = bubbleBackgroundColor
        addSubview(expertiseLabel)
        configureLabel()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        backgroundColor = bubbleBackgroundColor
        addSubview(expertiseLabel)
        configureLabel()
    }
    
    override var intrinsicContentSize : CGSize
    {
        layer.cornerRadius = 10
        return CGSize(width: 100, height: 20)
    }
    
    //MARK: Utility Functions
    fileprivate func configureLabel()
    {
        expertiseLabel.translatesAutoresizingMaskIntoConstraints = false
        expertiseLabel.textAlignment = .center
        expertiseLabel.textColor = UIColor.white
        expertiseLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        expertiseLabel.adjustsFontSizeToFitWidth = true
        expertiseLabel.minimumScaleFactor = 0.5
        expertiseLabel.clipsToBounds = true
        
        expertiseLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        expertiseLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        expertiseLabel.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, constant: -8).isActive = true
    }
}
