//
//  APIHelper.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftyUserDefaults
import SwiftKeychainWrapper

class APIHelper {
    /**  
     Replace this url with your own. 
     https://restcountries.eu is used as an example of one.
     */
    static let BASE_URL = "https://restcountries.eu"
    
    /**
     Modify this enum to work with your own services.
     */
    enum API: String {
        case countries = "/rest/v1/all"
        case register = "/register"
        case login = "/login"
    }
    
    /**
     If your server use token for authentication this is already working, if not remove or modify as you wish.
     */
    static var token:String?
    
    /**
     Alamofire Manager in static var.
     */
    static var alamofireManager : Alamofire.Manager?
    
    /**
     Everything that you need to send in headers to your server. This is the place.
     */
    static func config() -> Alamofire.Manager{
        var addedHeaders = Manager.defaultHTTPHeaders
        if self.token != nil {
            addedHeaders["token_auth"] = self.token
        }
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForResource = 2
        configuration.HTTPAdditionalHeaders = addedHeaders
        
        alamofireManager = Alamofire.Manager(configuration: configuration)
        return alamofireManager!
    }
    
    /**
     Isn't this awesome, countries json is converted to array of CountryModel. You can use this methot for all GET requests in your app. 
     Make sure you created a model for that request first.
     */
    static func countries(onCompletion: ([CountryModel]?) -> Void){
        let request = self.config().request(.GET, BASE_URL + API.countries.rawValue)
        request.responseArray { (response: [CountryModel]?, error: ErrorType?) in
            if response != nil {
                onCompletion(response!)
            } else {
                onCompletion(nil)
            }
        }
    }
    
    
    /**
     Modify this method to work with your own login service or just uncomment the below code if you use token auth.
     */
    static func login(email: String, password:String, onCompletion: (Bool) -> Void){
        if email == Defaults[.email] {
            let savedPassword: String? = KeychainWrapper.defaultKeychainWrapper().stringForKey(KeychainKeys.password.rawValue)
            if password == savedPassword {
                onCompletion(true)
            } else {
                onCompletion(false)
            }
        } else {
            onCompletion(false)
        }
    }
    
    /**
     Modify this method to work with your own register service or just uncomment the below code.
     */
    static func register(email: String, password:String, onCompletion: (Bool) -> Void){
        Defaults[.email] = email
        
        let savePassword: Bool = KeychainWrapper.defaultKeychainWrapper().setString(password, forKey: KeychainKeys.password.rawValue)
        if savePassword {
            onCompletion(true)
        } else {
            onCompletion(false)
        }
    }
    
}
