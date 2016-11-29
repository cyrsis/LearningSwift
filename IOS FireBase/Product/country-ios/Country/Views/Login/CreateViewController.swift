//
//  CreateViewController.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import Foundation
import SwiftyUserDefaults
import JLToast
import MaterialKit
import RNLoadingButton
import Async

class CreateViewController : BaseViewController, UITextFieldDelegate {
    
    @IBOutlet var inputFullName: MKTextField!
    @IBOutlet var inputEmail: MKTextField!
    @IBOutlet var inputPassword: MKTextField!
    @IBOutlet var createAccount: RNLoadingButton!
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var descriptionMessage: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextFields(inputFullName, placeholder: "Full Name")
        self.setupTextFields(inputEmail, placeholder: "Email")
        self.setupTextFields(inputPassword, placeholder: "Password")
        
        createAccount.backgroundColor = UIColor.clearColor()
        createAccount.layer.cornerRadius = 5
        createAccount.layer.borderWidth = 1
        createAccount.layer.borderColor = UIColor.whiteColor().CGColor
        createAccount.hideTextWhenLoading = true
        createAccount.loading = false
        createAccount.setActivityIndicatorStyle(UIActivityIndicatorViewStyle.White, forState: UIControlState.Disabled)
        createAccount.activityIndicatorEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.inputFullName.text = ""
        self.inputEmail.text = ""
        self.inputPassword.text = ""
        self.navigationController?.navigationBar.hidden = true
    }
    
    /**
     Create Account button action.
     */
    @IBAction func createAccount(sender: RNLoadingButton) {
        self.startButtonLoader()
        
        Async.main(after: 0.5) { // remove this if you don't want any wait time
            self.validate { () -> Void in
                APIHelper.register(self.inputEmail.text!, password: self.inputPassword.text!, onCompletion: { (success) -> Void in
                    if success == true {
                        APIHelper.countries { (countries) -> Void in
                            CountryDataHelper.importCountries(countries, onCompletion: { () -> Void in
                                self.performSegueWithIdentifier(SegueIdentifier.Main.rawValue, sender: self)
                                self.stopButtonLoader()
                            })
                        }
                    } else {
                        JLToast.makeText("Registration failed. Please try again!").show()
                        self.stopButtonLoader()
                    }
                })
            }
        }
    }
    
    /**
     This method will start the loader indicator on Sign In button.
     */
    func startButtonLoader(){
        createAccount.enabled = false
        createAccount.loading = true;
        createAccount.hideImageWhenLoading = true
    }
    
    /**
     This method will stop the loader indicator on Sign In button.
     */
    func stopButtonLoader(){
        createAccount.enabled = true
        createAccount.loading = false
        
        if createAccount.tag == 3 {
            createAccount.selected = !createAccount.selected
        }
    }
    
    /**
     This method will validate all text fields in CreateViewController on Sign In action.
     */
    func validate(completed: () -> Void){
        if self.inputFullName.text!.isEmpty || !self.inputFullName.text!.isFullName {
            self.shake(self.inputFullName, messsage: "Please enter full name!")
            self.stopButtonLoader()
        } else {
            if self.inputEmail.text!.isEmpty {
                self.shake(self.inputEmail, messsage: "Please enter email!")
                self.stopButtonLoader()
            } else {
                if !self.inputEmail.text!.isEmail {
                    self.shake(self.inputEmail, messsage: "Please enter valid email!")
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
    }
    
    /**
     Move to Sign In view
     */
    @IBAction func signIn(sender: AnyObject) {
        performSegueWithIdentifier(SegueIdentifier.Login.rawValue, sender: self)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.inputEmail {
            if self.inputEmail.text!.isEmpty {
                self.shake(self.inputEmail, messsage: "Please enter email!")
                self.stopButtonLoader()
            } else {
                if !self.inputEmail.text!.isEmail {
                    self.shake(self.inputEmail, messsage: "Please enter valid email!")
                    self.stopButtonLoader()
                } else {
                    
                }
            }
        }
    }
    
}