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
        default:
            return false
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

}
