//
//  ShortCutItemHelper.swift
//  Rent A Dev
//
//  Created by Jordan Morgan on 9/17/16.
//  Copyright © 2016 Pluralsight, LLC. All rights reserved.
//

import Foundation
import UIKit

enum IncomingShortcutItem: String
{
    case ShowFavorites
    case ShowDeveloper
    fileprivate static let prefix: String = {
        return Bundle.main.bundleIdentifier! + "."
    }()
    
    init?(shortCutType: String)
    {
        guard let bundleStringRange = shortCutType.range(of: IncomingShortcutItem.prefix) else
        {
            return nil
        }
        
        var enumValueString = shortCutType
        enumValueString.removeSubrange(bundleStringRange)
        self.init(rawValue: enumValueString)
    }
}

struct ShortcutItemHelper
{
    static let profileKey = "devKey"
    
    //MARK: Shortcut creation
    static func createShortcutItem(with developer:Developer)
    {
        //If the developer is already there, skip it
        guard ((UIApplication.shared.shortcutItems?.filter { $0.localizedTitle == developer.name }.count)! <= 0) else
        {
            return
        }
        
        let maxShortcutItemsLimitReached = UIApplication.shared.shortcutItems?.count == 3
        let shortcutIcon = UIApplicationShortcutIcon(type: .contact)
        let shortCutItem = UIApplicationShortcutItem(type: IncomingShortcutItem.prefix + "ShowDeveloper", localizedTitle: developer.name, localizedSubtitle: developer.expertise, icon: shortcutIcon, userInfo: [profileKey : NSKeyedArchiver.archivedData(withRootObject: developer)])
        
        if maxShortcutItemsLimitReached
        {
            //Replace the oldest developer
            UIApplication.shared.shortcutItems?.removeFirst()
        }
        
        UIApplication.shared.shortcutItems?.append(shortCutItem)
    }
    
    //MARK: Shortcut Handling
    
    //Takes in a shortcutitem and decides which one it is and handles it (i.e. Favorites vs Dev Details)
    @discardableResult
    static func handleShortcutItem(_ shortcutItem:UIApplicationShortcutItem) -> Bool
    {
        guard let shortCutAction = IncomingShortcutItem(shortCutType: shortcutItem.type) else
        {
            return false
        }
        
        switch shortCutAction
        {
        case .ShowFavorites:
            //Handle static quick action to show favorites
            return ShortcutItemHelper.handleShortcutActionShowFavorites()
            
        case .ShowDeveloper:
            //Handle dynamic quick action of showing a certain developer
            guard let devData = shortcutItem.userInfo?[ShortcutItemHelper.profileKey] as? Data, let developer = NSKeyedUnarchiver.unarchiveObject(with: devData) as? Developer else
            {
                return false
            }
            
            return ShortcutItemHelper.handleShortcutAction(with: developer)
        }

        
    }
    
    //Handles the favorite shortcut
    static func handleShortcutActionShowFavorites() -> Bool
    {
        guard let rootNavigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else
        {
            return false
        }
        
        rootNavigationViewController.popToRootViewController(animated: false)
        
        guard let developersViewController = rootNavigationViewController.topViewController as? RentableDevsViewController else
        {
            return false
        }
        
        developersViewController.showFavoriteDevelopers()
        
        return true
    }

    //Handles the developer details shortcut
    static func handleShortcutAction(with developer:Developer) -> Bool
    {
        guard let rootNavigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else
        {
            return false
        }
        
        let appStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let devDetailViewController = appStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as? DeveloperDetailViewController else
        {
            return false
        }
        
        rootNavigationViewController.popToRootViewController(animated: false)
        devDetailViewController.developer = developer
        rootNavigationViewController.pushViewController(devDetailViewController, animated: false)
        
        return true
    }
}
