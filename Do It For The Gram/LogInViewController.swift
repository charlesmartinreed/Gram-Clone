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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    //MARK:- Login/signup actions
    @IBAction func recoverPasswordButtonTapped(_ sender: UIButton) {
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func facebookLoginButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
    }
    
}

