//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by Simon Allardice on 10/23/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create task arrays
    let dailyTasks = ["Check all windows",
        "Check all doors",
        "Check temperature of freezer",
        "Check the mailbox at the end of the lane",
        "Empty trash containers",
        "If freezing, check water pipes outside"]
    
    let weeklyTasks = ["Check inside all unoccupied cabins",
        "Run all faucets for 30 seconds",
        "Walk the perimeter of property",
        "Arrange for dumpster pickup"]
    
    let twoWeekTasks = ["Run test on security alarm",
        "Check all motion detectors",
        "Test smoke alarms"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

