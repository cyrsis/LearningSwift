//
//  UIViewInspectable.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 8/14/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    @IBInspectable var cornerRadius: CGFloat
    {
        get
        {
            return layer.cornerRadius
        }
        set
        {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

extension UIViewController
{
    func showAlertWith(title:String, message:String) -> UIAlertController
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}
