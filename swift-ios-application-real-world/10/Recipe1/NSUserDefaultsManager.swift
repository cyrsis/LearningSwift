//
//  NSUserDefaultsManager.swift
//  Recipe1
//
//  Created by Brett Romero on 4/19/15.
//  Copyright (c) 2015 Brett Romero. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    static let userDefaults = NSUserDefaults.standardUserDefaults()
    
    class func synchronize(){
        let myData = NSKeyedArchiver.archivedDataWithRootObject(RecipeManager.recipes)
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "recipearray")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func initializeDefaults() {
        if let recipesRaw = NSUserDefaults.standardUserDefaults().dataForKey("recipearray") {
            if let recipes = NSKeyedUnarchiver.unarchiveObjectWithData(recipesRaw) as? [Recipe] {
                RecipeManager.recipes = recipes
            }
        }
    }
}
