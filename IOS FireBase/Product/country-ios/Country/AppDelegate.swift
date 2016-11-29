//
//  AppDelegate.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.
//

import UIKit
import IQKeyboardManager
import SwiftyUserDefaults
import Firebase
import FirebaseMessaging
import FirebaseInstanceID

enum KeychainKeys: String {
    case password           = "password"
}

// All segue identifiers used in app
enum SegueIdentifier: String {
    case Main               = "main_sw"
    case Login              = "loginAccountSegue"
    case CreateAccount      = "createAccountSegue"
    case Settings           = "settingsSeague"
    case Countries          = "contriesSeague"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var googlePlistExists = false

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
    
        self.initDefaultKeys()
        
        UINavigationBar.appearance().barStyle = .BlackTranslucent
        IQKeyboardManager.sharedManager().enable = true
        SchemaVersioning.databaseMigration()// create database and perform versioning if needed
        
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
        
        if NSBundle.mainBundle().pathForResource("GoogleService-Info", ofType: "plist") != nil {
            googlePlistExists = true
        }
        
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        
        if googlePlistExists == true {
            UIApplication.sharedApplication().registerForRemoteNotifications()
            
            FIRApp.configure()
            
            // Add observer for InstanceID token refresh callback.
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.tokenRefreshNotification), name: kFIRInstanceIDTokenRefreshNotification, object: nil)
        }
        
        let appData = NSDictionary(contentsOfFile: AppDelegate.pushAndAdsPath())
        if let oneSignalAppID = appData?.valueForKey("OneSignalAppID") as? String {
            OneSignal.initWithLaunchOptions(launchOptions, appId: oneSignalAppID) { (result) in
                
                // This block gets called when the user reacts to a notification received
                
                let payload = result.notification.payload
                let messageTitle = "OneSignal Example"
                var fullMessage = payload.title
                
                //Try to fetch the action selected
                if let additionalData = payload.additionalData, actionSelected = additionalData["actionSelected"] as? String {
                    fullMessage =  fullMessage + "\nPressed ButtonId:\(actionSelected)"
                }
                
                let alert = UIAlertController(title: messageTitle, message:fullMessage, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK.", style: .Default) { _ in })
                self.window?.rootViewController?.presentViewController(alert, animated: true){}
            }
        } else {
            print("OneSignal API Key is not in the plist file!")
        }

        return true
    }
    
    func initDefaultKeys() {
        Defaults[.showNavigation] = true
        
        if !Defaults.hasKey(.autologin){
            Defaults[.autologin] = false
        }
    }
    
    func tokenRefreshNotification(notification: NSNotification) {
        let refreshedToken:String? = FIRInstanceID.instanceID().token()
        print("FOREBASE TOKEN: \(refreshedToken)")
        FIRMessaging.messaging().connectWithCompletion { (error) in
            if (error != nil) {
                print("Unable to connect with FCM. \(error)")
            } else {
                print("Connected to FCM.")
            }
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        // Print message ID.
        print("Message ID: \(userInfo["gcm.message_id"]!)")
        
        // Print full message.
        print("%@", userInfo)
        
        let notificationMessage : AnyObject? =  userInfo["alert"]
        let alert = UIAlertController(title: "UniversalWebView", message:notificationMessage as? String, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK.", style: .Default) { _ in })
        self.window?.rootViewController?.presentViewController(alert, animated: true){}
        
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: FIRInstanceIDAPNSTokenType.Sandbox)
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        print("Couldn't register: \(error)")
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        if googlePlistExists == true {
            FIRMessaging.messaging().disconnect()
            print("Disconnected from FCM.")
        }
        
        Defaults[.showInterstitial] = false
    }
    
    static func pushAndAdsPath() -> String {
        return NSBundle.mainBundle().pathForResource("PushAndAds", ofType: "plist")!
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        Defaults[.showInterstitial] = true
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

