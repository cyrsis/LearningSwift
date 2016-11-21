//
//  ViewController.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/6/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		//some sort of Dependency Injection
		let computerController = MockComputerController()
		var computerAddresses = [String]()
		for _ in 0...25{
			computerAddresses.append("localhost")
		}
		computerController.getComputer(computerAddresses) { (computer, err) -> Void in
			
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

