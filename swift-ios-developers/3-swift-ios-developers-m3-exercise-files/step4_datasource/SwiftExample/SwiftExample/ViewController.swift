//
//  ViewController.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/6/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//
//We don't want a monster view contoller (MVC)
import UIKit

class ViewController: UIViewController {

	@IBOutlet private weak var dataSource:ComputersDataSource!
	@IBOutlet private weak var collectionView:UICollectionView!
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		//some sort of Dependency Injection
		let computerController = MockComputerController()
		var computerAddresses = [String]()
		for _ in 0...25{
			computerAddresses.append("localhost")
		}
		
		computerController.getComputer(computerAddresses) { [unowned self](computers, err) -> Void in
			self.dataSource.computers = computers
		}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

