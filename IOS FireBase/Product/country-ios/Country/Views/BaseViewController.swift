//
//  BaseViewController.swift
//  Country
//
//  Created by Mario Kovacevic on 09/05/16.
//  Copyright © 2016 Brommko, LLC. All rights reserved.

import Foundation
import Async
import JLToast
import pop
import MaterialKit

class BaseViewController : UIViewController{
        
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func viewControllerForPresentingModalView() -> UIViewController {
        return self
    }
    
    /**
     If you want to shake your UITextField, just sent it in this method with message. Message will be shown like Toast.
     
     - Parameter textFieldu:    UITextField to shake.
     - Parameter messsage:      String to show like Toast.
     */
    func shake(textField:UITextField, messsage:String) {
        Async.main{
            let shake = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
            shake.springBounciness = 20
            shake.velocity = NSNumber(int: 3000)
            textField.layer.pop_addAnimation(shake, forKey: "shakePassword")
        }
        JLToast.makeText(messsage).show()
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    /**
     This is an example of MKTextField Material design component. Modify the method if you have your own design
     
     - Parameter textField:    MKTextField
     - Parameter placeholder:  String to set as placeholder
     */
    func setupTextFields(textField:MKTextField, placeholder:String){
        // No border, no shadow, floatingPlaceholderEnabled
        textField.textColor = UIColor.whiteColor()
        textField.layer.borderColor = UIColor.clearColor().CGColor
        textField.floatingPlaceholderEnabled = true
        textField.floatingLabelTextColor = UIColor(hex: 0xe4fde1)
        textField.placeholder = placeholder
        textField.tintColor = UIColor.whiteColor()
        textField.cornerRadius = 0
        textField.bottomBorderEnabled = true
        textField.bottomBorderColor = UIColor.whiteColor()
        textField.bottomBorderWidth = CGFloat(0.5)
        textField.bottomBorderHighlightWidth = CGFloat(1.0)
        textField.attributedPlaceholder = NSAttributedString(string:placeholder, attributes:[NSForegroundColorAttributeName: UIColor(hex: 0xe4fde1)])
    }

}