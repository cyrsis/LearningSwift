//
//  SwiftViewController.swift
//  ObjCSwiftDemo
//
//  Created by Jon Flanders on 1/30/16.
//  Copyright © 2016 Flounderware. All rights reserved.
//

import UIKit


class SwiftViewController: UIViewController {
	
	var data:String?
	
	var vc:ViewController?
	@IBOutlet private weak var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.label.text = "Hello from Swift!"
		if let d = self.data{
			self.label.text = d
		}
		
		
        // Do any additional setup after loading the view.
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
