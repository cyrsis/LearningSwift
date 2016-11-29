//
//  SQLiteDataStore.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDataStore {
    var DB: Connection?
    
    class var sharedInstance: SQLiteDataStore {
        struct Static {
            static var instance = SQLiteDataStore()
        }
        if Static.instance.DB == nil {
            Static.instance = SQLiteDataStore()
        }
        return Static.instance
    }
    
    private init() {
        
        print("DATABASE_PATH: \(SQLiteDataStore.getDatabasePath())")
        
        self.createConnection()
    }
    
    private func createConnection() {
        do {
            DB = try Connection(SQLiteDataStore.getDatabasePath())
            guard DB != nil else {
                fatalError("There is no connection for database")
            }
            
            DB!.trace { msg in
                print("message: \(msg)")
            }
        } catch {
            fatalError("Error catch: No connection for database")
        }
    }
    
    static func getDatabasePath() -> String {
        let documentDirectoryURL =  try! NSFileManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        return documentDirectoryURL.URLByAppendingPathComponent(SQLiteDataStore.getAppName()).path!
    }
    
    static func getAppName() -> String {
        // get app name from bundle
        let appName:String? = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String + ".sqlite"
        guard appName != nil else {
            fatalError("There is no App name")
        }
        return appName!
    }
    
    internal var userVersion: Int {
        get {
            do {
                let count = DB!.scalar("PRAGMA user_version") as! Int64
                return Int(count)
            }
        }
        set {
            do {
                try DB!.run("PRAGMA user_version = \(newValue)")
            } catch {
                print("Error!")
            }
        }
    }
    
    static func deleteDatabase(){
        SQLiteDataStore.sharedInstance.DB = nil
        
        let filemgr = NSFileManager.defaultManager()
        var error: NSError?
        do {
            if filemgr.fileExistsAtPath(SQLiteDataStore.getDatabasePath()) == true {
                try filemgr.removeItemAtPath(SQLiteDataStore.getDatabasePath())
            }
        } catch let error1 as NSError {
            error = error1
            print("Failed to delete database: \(error!.localizedDescription)")
        }
    }
    
}
