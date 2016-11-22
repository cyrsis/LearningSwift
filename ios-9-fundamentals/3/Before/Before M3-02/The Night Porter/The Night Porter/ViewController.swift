//
//  ViewController.swift
//  The Night Porter
//
//  Created by Simon Allardice on 10/20/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func darkMode(sender: AnyObject) {
        view.backgroundColor = UIColor.darkGrayColor()
        
        for eachControl in view.subviews {
            if let label = eachControl as? UILabel {
                label.textColor = UIColor.lightGrayColor()
            }
        }
        
    }

}

