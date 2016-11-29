//
//  CountriesViewController.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import Foundation
import UIKit
import SWRevealViewController
import GoogleMobileAds
import SwiftyUserDefaults
import Async

class CountriesViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate, GADInterstitialDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var bannerView: GADBannerView!

    /**
     Array of CountryModel objects
     */
    var countries = [CountryModel]()
    
    /**
     Current Region selected in Navigation
     */
    var currentRegion:Navigation = Navigation.Africa

    var refreshControl:UIRefreshControl!
    
    var interstitial: GADInterstitial!
    let request = GADRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationPanel()
    
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(CountriesViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)

        self.tableView.addSubview(refreshControl)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.request.testDevices = [
            kGADSimulatorID// Simulator
        ]
        
        self.loadInterstitialOnceWhenInTheApp()
    }
    
    /**
     If app is just opened, we will load the interstital. Interstital will not be trigered until next app open.
     */
    func loadInterstitialOnceWhenInTheApp() {
        if Defaults[.showInterstitial].boolValue == true {
            let appData = NSDictionary(contentsOfFile: AppDelegate.pushAndAdsPath())
            let interstitialId = appData?.valueForKey("AdMobInterstitialUnitId") as? String
            if interstitialId != nil {
                self.interstitial = GADInterstitial(adUnitID: interstitialId!)
                self.interstitial!.delegate = self
                self.interstitial!.loadRequest(self.request)
            }
        }
    }
    
    /**
     Refresh fetch all countries from GET request, then countrie models are passed in CountryDataModel class where insert or update will be made. 
     After that, all countries are fetched from the database again in same array of country models as from server.
     */
    func refresh(sender:AnyObject) {
        APIHelper.countries { (countries) -> Void in
            CountryDataHelper.importCountries(countries, onCompletion: { () -> Void in
                self.countries = CountryDataHelper.findAll()!
                self.refreshControl.endRefreshing()
            })
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationItem.title =  currentRegion.rawValue
        self.countries = CountryDataHelper.findAllForRegion(currentRegion)!
    }
    
    override func viewDidAppear(animated: Bool) {
        if Defaults[.showInterstitial].boolValue == true {
            if self.interstitial != nil && self.interstitial.isReady {
                self.interstitial.presentFromRootViewController(self)
                Defaults[.showInterstitial] = false
            } else {
                self.loadBannerAd()
            }
        } else {
            self.loadBannerAd()
        }
        
        self.showNavigationOnStartup()
    }
    
    /**
     Navigation will slide open if user just opened the app.
     */
    func showNavigationOnStartup() {
        if Defaults[.showNavigation].boolValue == true {
            self.revealViewController().revealToggleAnimated(true)
            Defaults[.showNavigation] = false
        }
    }
    
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        bannerView.hidden = false
    }
    
    func adView(bannerView: GADBannerView!, didFailToReceiveAdWithError error: GADRequestError!) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func loadBannerAd(){
        let appData = NSDictionary(contentsOfFile: AppDelegate.pushAndAdsPath())
        let bannerId = appData?.valueForKey("AdMobBannerUnitId") as? String
        if bannerId != nil {
            self.bannerView!.adUnitID = bannerId
            self.bannerView!.rootViewController = self
            self.bannerView!.loadRequest(self.request)
            self.bannerView!.delegate = self
        } else {
            self.bannerView?.removeFromSuperview()
        }
    }
    
    func interstitialDidDismissScreen(ad: GADInterstitial!) {
        self.loadBannerAd()
    }
    
    func setNavigationPanel(){
        let nav = self.navigationController?.navigationBar
        nav?.translucent = false
        nav?.barTintColor = UIColor(hex: 0x028090)
        nav?.tintColor = UIColor(hex: 0xe8f1f0)
        
        self.navigationItem.title =  currentRegion.rawValue
        
        let menuBtn:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Plain, target: self, action: #selector(CountriesViewController.openNavigationMenu))
        self.navigationItem.leftBarButtonItems = [menuBtn]
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CountriesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CountriesTableViewCell") as! CountriesTableViewCell
        cell.countryTitle.text = self.countries[indexPath.row].name
        cell.countryDescription.text = self.countries[indexPath.row].capital
        cell.countrySpecific.text = self.countries[indexPath.row].region
        
        tableView.rowHeight = 64
        cell.textLabel?.font = UIFont.systemFontOfSize(22)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }

    func openNavigationMenu() {
        self.revealViewController()
    }
}
