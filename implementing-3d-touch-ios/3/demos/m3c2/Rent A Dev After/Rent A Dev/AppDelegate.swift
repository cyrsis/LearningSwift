//
//  AppDelegate.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 7/4/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    //MARK: Properties
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem
        {
            ShortcutItemHelper.handleShortcutItem(shortcutItem)
            return false
        }
        
        return true
    }
    
    //MARK: 3D Touch Shortcut Handling
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void)
    {
        completionHandler(ShortcutItemHelper.handleShortcutItem(shortcutItem))
    }
}
