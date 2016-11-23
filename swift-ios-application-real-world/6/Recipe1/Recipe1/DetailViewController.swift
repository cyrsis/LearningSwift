//
//  DetailViewController.swift
//  Recipe1
//
//  Created by Brett Romero on 3/29/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var preRecipe:Recipe?
    @IBOutlet var recipeContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)

    }

    override func viewDidAppear(animated: Bool) {
        self.title = preRecipe?.title
        self.recipeContent.text = preRecipe?.content
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