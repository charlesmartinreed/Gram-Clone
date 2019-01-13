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

        phoneEmailSegControl.selectedSegmentIndex = 0
    }
    
    
    //MARK:- IBActions
    @IBAction func signUpNextScreenButtonTapped(_ sender: Any) {
        //check for values in the text field
        guard let textField = phoneEmailTextField.text else { return }
        
        if phoneEmailSegControl.selectedSegmentIndex == 0 {
            if textField == "" {
                displayAlert(title: "Phone number is invalid", message: "Please enter a valid phone number")
            } else {
                user["phone"] = textField
                performSegue(withIdentifier: "toAddNameVC", sender: nil)
            }
            
        }
        
        if phoneEmailSegControl.selectedSegmentIndex == 1 {
            if textField == "" {
                displayAlert(title: "Email address is invalid", message: "Please enter a valid email address")
            } else {
                user.email = textField
                performSegue(withIdentifier: "toAddNameVC", sender: nil)
            }
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
