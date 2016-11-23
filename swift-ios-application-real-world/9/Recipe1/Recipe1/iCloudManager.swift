//
//  iCloudManager.swift
//  Recipe1
//
//  Created by Brett Romero on 4/30/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class iCloudManager: NSObject {
    
    class func getFromCloud(){
        let iCloudStore = NSUbiquitousKeyValueStore.defaultStore()
        let fromCloud = iCloudStore.objectForKey("recipearray") as! NSData
        RecipeManager.recipes = NSKeyedUnarchiver.unarchiveObjectWithData(fromCloud) as! [Recipe]!
    }
    
    class func sendToCloud() {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        let iCloudStore = NSUbiquitousKeyValueStore.defaultStore()
        iCloudStore.setObject(myData, forKey: "recipearray")
        iCloudStore.synchronize()   
    }
   
}
