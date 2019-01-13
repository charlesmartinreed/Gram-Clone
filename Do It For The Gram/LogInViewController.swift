//
//  ViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/11/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    //MARK:- Properties
    var userIsLoggedIn = false
    var currentUser = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if currentUser == nil {
            return
        } else {
            //sent them to the homescreen directly
        }
    }


    //MARK:- Login/signup actions
    @IBAction func recoverPasswordButtonTapped(_ sender: UIButton) {
        
    }
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        //check for valid text entry in the text fields
        guard let userLogin = loginEmailTextField.text else { return }
        guard let userPassword = loginPasswordTextField.text else { return }
        
        if userLogin == "" || userPassword == "" {
            self.displayAlert(title: "Please enter username and password", message: "Username and password fields cannot be blank.")
        } else {
            //try to log the user in
            PFUser.logInWithUsername(inBackground: userLogin, password: userPassword) { (user, error) in
                if user != nil {
                    //present successful login screen
                    print("login was successful")
                    self.currentUser = user
                } else {
                      self.displayAlert(title: "Unable to log in", message: error!.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func facebookLoginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
    }
    
}

