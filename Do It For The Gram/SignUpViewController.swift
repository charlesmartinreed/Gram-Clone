//
//  SignUpViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var phoneEmailSegControl: UISegmentedControl!
    @IBOutlet weak var phoneEmailTextField: UITextField!
    
    
    //MARK:- Properties
    var signupModeisActive = true
    var user = PFUser()
    
    //phone
    //email
    //username
    //password
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK:- IBActions
    @IBAction func signUpNextScreenButtonTapped(_ sender: Any) {
        //check for values in the text field
        guard let textField = phoneEmailTextField.text else { return }
        
        switch phoneEmailSegControl.selectedSegmentIndex {
        case 0:
            //create a phone number associated with the user
            if textField != "" {
                user["phone"] = textField
                performSegue(withIdentifier: "toAddNameVC", sender: nil)
            
            } else if textField == "" {
                displayAlert(title: "Phone number is invalid", message: "Please enter a valid phone number")
            }
        case 1:
            //create an email account associated with the user
            if textField != "" {
                user.email = textField
                performSegue(withIdentifier: "toAddNameVC", sender: nil)
                
            } else if textField == "" {
                displayAlert(title: "Email address is invalid", message: "Please enter a valid email address")
            }
        default:
            break
        }
        
    }
    
    @IBAction func phoneEmailSegControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            phoneEmailTextField.placeholder = "Phone Number"
            phoneEmailTextField.keyboardType = .decimalPad
        } else if sender.selectedSegmentIndex == 1 {
            phoneEmailTextField.placeholder = "Email address"
            phoneEmailTextField.keyboardType = .emailAddress
        }
    }
    
    @IBAction func returnToSignInScreen(_ sender: UIButton) {
        signupModeisActive = false
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toAddNameVC" {
                if let destinationVC = segue.destination as? SignUpViewSecondViewController {
                    destinationVC.user = user
                }
            }
    }

}
