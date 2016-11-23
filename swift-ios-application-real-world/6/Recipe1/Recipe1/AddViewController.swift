//
//  AddViewController.swift
//  Recipe1
//
//  Created by Brett Romero on 3/29/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var titleText: UITextField!
    @IBOutlet var recipeContent: UITextView!
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleText.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        recipeContent.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)

        addButton.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textTitleDidChange", name: UITextFieldTextDidChangeNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "recipeContentDidChange", name: UITextViewTextDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textTitleDidChange(){
        handleButtonStates()
    }
    
    func recipeContentDidChange(){
        handleButtonStates()
    }

    @IBAction func doneButton_click(sender: AnyObject) {
        recipeContent.resignFirstResponder()
    }
    
    @IBAction func titleDoneButton_click(sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    

    func handleButtonStates(){
        //handle done button
        if(recipeContent.text != ""){
            doneButton.enabled = true
        }
        else {
            doneButton.enabled = false
        }
        
        //handle add button
        if(titleText.text != "" && recipeContent.text != ""){
            addButton.enabled = true
            addButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        else {
                addButton.enabled = false
                addButton.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
    }
    
    @IBAction func addButton_click(sender: AnyObject) {
        
        RecipeManager.AddRecipe(titleText.text, content: recipeContent.text)
        titleText.text = ""
        recipeContent.text = ""
        
        NSUserDefaultsManager.synchronize()
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