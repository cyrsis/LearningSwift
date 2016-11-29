//
//  NavigationViewController.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import UIKit
import SwiftyUserDefaults

/**
Enum of all items in Navigation list
 */
enum Navigation: String {
    case Asia = "Asia"
    case Europe = "Europe"
    case Africa = "Africa"
    case Oceania = "Oceania"
    case Americas = "Americas"
    case Settings = "Settings"

    static let allValues = [Asia, Europe, Africa, Oceania, Americas, Settings]
}

class NavigationViewController : BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var defaultNav: Bool!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationPanel()
        
        let displayHeight = UIScreen.mainScreen().nativeBounds.height
        if displayHeight <= 960 {
            tableView.rowHeight = 34
        } else if displayHeight > 960 {
            tableView.rowHeight = 42
        }
        
        defaultNav = false
        
        tableView.backgroundColor = UIColor(hex: 0x028090)
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (!defaultNav){
            let indexPath:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
            tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None)
            defaultNav = true;
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Navigation.allValues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: NavigationTableViewCell = NavigationTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: NavigationTableViewCell.identifier)
        cell.textLabel?.text = Navigation.allValues[indexPath.row].rawValue
        cell.imageView?.image = UIImage(named: Navigation.allValues[indexPath.row].rawValue)

        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor(white: 0xE8F1F2, alpha: 0.5).CGColor
        border.frame = CGRect(x: -1, y: cell.textLabel!.frame.size.height - width, width: UIScreen.mainScreen().nativeBounds.width, height: cell.frame.size.height)
        
        border.borderWidth = width
        cell.layer.addSublayer(border)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {        
        if let menu = Navigation(rawValue: Navigation.allValues[indexPath.row].rawValue) {
            switch menu {
            case .Settings:
                self.performSegueWithIdentifier(SegueIdentifier.Settings.rawValue, sender: self)
                break
            default:
                self.performSegueWithIdentifier(SegueIdentifier.Countries.rawValue, sender: self)
                break
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == SegueIdentifier.Countries.rawValue){
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationNavigationController = segue.destinationViewController as! UINavigationController
                let vc:CountriesViewController = destinationNavigationController.topViewController as! CountriesViewController
                vc.currentRegion = Navigation.allValues[indexPath.row]
            }
        }
    }
    
    func setNavigationPanel(){
        let nav = self.navigationController?.navigationBar
        nav?.translucent = false
        nav?.barTintColor = UIColor(hex: 0xffffff)
        nav?.tintColor = UIColor(hex: 0x028090)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .ScaleAspectFit
        
        let image = UIImage(named: "Logo")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
}