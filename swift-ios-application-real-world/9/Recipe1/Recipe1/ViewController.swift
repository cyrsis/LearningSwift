//
//  ViewController.swift
//  Recipe1
//
//  Created by Brett Romero on 3/28/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 70
        tableView.backgroundView = UIImageView(image: UIImage(named: "breads"))
        
        NSUserDefaultsManager.initializeDefaults()
        initializeiCloud()
        
    }
    
    func initializeiCloud(){
        let fileManager = NSFileManager.defaultManager()
        let iCloudURL = fileManager.ubiquityIdentityToken
        if(iCloudURL != nil && Reachability.isConnectedToNetwork()){
            let store = NSUbiquitousKeyValueStore.defaultStore()
            let notification = NSNotificationCenter.defaultCenter()
            notification.addObserver(self, selector: "updateFromiCloud:", name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: store)
            store.synchronize()
        }
    }
    
    func updateFromiCloud(notification:NSNotification) {
        iCloudManager.getFromCloud()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeManager.recipes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell") as! customcell
        
        if(indexPath.item % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        let recipe = RecipeManager.recipes[indexPath.item]
        cell.textLabel?.text = recipe.title
        cell.recipe = recipe
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete){
            RecipeManager.DeleteRecipe(indexPath.item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            iCloudManager.sendToCloud()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detailview"){
            let cell = sender as! customcell
            let detailview = segue.destinationViewController as! DetailViewController
            detailview.preRecipe = cell.recipe
        }
    }
}

