//
//  ViewController.swift
//  The Night Porter
//
//  Created by Simon Allardice on 10/20/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func darkMode(sender: AnyObject) {
        view.backgroundColor = UIColor.darkGrayColor()
        
        // get all subviews inside the top-level view
        let allSubviews = view.subviews
        
        for eachView in allSubviews {
            if eachView is UILabel {
                let myLabel = eachView as! UILabel
                myLabel.textColor = UIColor.lightGrayColor()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

