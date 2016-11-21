//
//  ViewController.swift
//  SwiftExample
//
//  Created by Jon Flanders on 2/6/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//
import UIKit
//avoid the MVC - "monster view controller"
//view controller with more than N lines of code
//N - 1000
class ViewController: UIViewController {

	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet private weak var dataSource:ComputerDataSource!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let modelController:ComputerModelController = getModelController()
		let ips = ["localhost","localhost","localhost","localhost","localhost","localhost","localhost","localhost"]
		modelController.getComputers(ips) { [unowned self](computers, err) -> Void in
			self.dataSource.computers = computers
		}
		// Do any additional setup after loading the view, typically from a nib.
		
	}
	func getModelController()->ComputerModelController
	{//dependency injection
		return MockModelController()
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

