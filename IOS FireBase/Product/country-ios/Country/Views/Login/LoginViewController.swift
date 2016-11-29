//
//  LoginViewController.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import Foundation
import SwiftyUserDefaults
import Async
import JLToast
import MaterialKit
import RNLoadingButton

class LoginViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet var inputUsername: MKTextField!
    @IBOutlet var inputPassword: MKTextField!
    @IBOutlet var btnSignIn: RNLoadingButton!
    @IBOutlet var btnCreateAccount: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    @IBAction func forgotPasswordAction(sender: AnyObject) {
        print("forgotPasswordAction", terminator: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSignIn.layer.cornerRadius = 5
        btnSignIn.hideTextWhenLoading = true
        btnSignIn.loading = false
        btnSignIn.setActivityIndicatorStyle(UIActivityIndicatorViewStyle.White, forState: UIControlState.Disabled)
        btnSignIn.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        
        self.setupTextFields(inputUsername, placeholder: "Email")
        self.setupTextFields(inputPassword, placeholder: "Password")
        
        btnSignIn.backgroundColor = UIColor.clearColor()
        btnSignIn.layer.cornerRadius = 5
        btnSignIn.layer.borderWidth = 1
        btnSignIn.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func viewWillAppear(animated: Bool) {
        self.inputUsername.text = ""
        self.inputPassword.text = ""
        self.navigationController?.navigationBar.hidden = true
    }
    
    /**
     Sign in button action
     */
    @IBAction func signIn(sender: RNLoadingButton) {
        self.startButtonLoader()
        
        Async.main(after: 0.5) { // remove this if you don't want any wait time
            self.validate { () -> Void in
                APIHelper.login(self.inputUsername.text!, password: self.inputPassword.text!) { (success) -> Void in
                    if success {
                        APIHelper.countries { (countries) -> Void in
                            CountryDataHelper.importCountries(countries, onCompletion: { () -> Void in
                                self.performSegueWithIdentifier(SegueIdentifier.Main.rawValue, sender: self)
                                self.stopButtonLoader()
                            })
                        }
                    } else {
                        JLToast.makeText("Server authentication failed!").show()
                        self.stopButtonLoader()
                    }
                }
            }
        }
    }
    
    /**
     This method will start the loader indicator on Sign In button.
     */
    func startButtonLoader(){
        btnSignIn.enabled = false
        btnSignIn.loading = true;
        btnSignIn.hideImageWhenLoading = true
    }
    
    /**
     This method will stop the loader indicator on Sign In button.
     */
    func stopButtonLoader(){
        btnSignIn.enabled = true
        btnSignIn.loading = false
        
        if btnSignIn.tag == 3 {
            btnSignIn.selected = !btnSignIn.selected
        }
    }
    
    /**
     This method will validate all text fields in LoginViewController on Sign In action.
     */
    func validate(completed: () -> Void){
        if self.inputUsername.text!.isEmpty {
            self.shake(self.inputUsername, messsage: "Please enter email!")
            self.stopButtonLoader()
        } else {
            if !self.inputUsername.text!.isEmail {
                self.shake(self.inputUsername, messsage: "Please enter valid email!")
                self.stopButtonLoader()
            } else {
                if self.inputPassword.text!.isEmpty {
                    self.shake(self.inputPassword, messsage: "Please enter password!")
                    self.stopButtonLoader()
                } else {
                    if self.inputPassword.text!.isPassword {
                        completed()
                    } else {
                        self.shake(self.inputPassword, messsage: "Password must be at least 8 characters!")
                        self.stopButtonLoader()
                    }
                }
            }
        }
    }
    
    /**
     Move to Create Account view
     */
    @IBAction func createAcount(sender: AnyObject) {
        self.performSegueWithIdentifier(SegueIdentifier.CreateAccount.rawValue, sender: self)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
}
