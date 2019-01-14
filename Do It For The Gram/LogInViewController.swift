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
    
//    func pauseAndDisplayActivityIndicator() -> UIActivityIndicatorView {
//        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: view.center.x - 25, y: view.center.y + 100, width: 50, height: 50))
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.style = .gray
//        
//        view.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
//        UIApplication.shared.beginIgnoringInteractionEvents()
//        
//        return activityIndicator
//    }
    
    //MARK:- IBOutlets
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    
    //MARK:- Properties
    var userIsLoggedIn = false
    var currentUser = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if currentUser == nil {
//            return
//        } else {
//            //sent them to the homescreen directly
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //segues can't be performed until the view actually appears, of course
        //if user is logged in
        if PFUser.current() != nil {
            performSegue(withIdentifier: "toUserTableVC", sender: self)
        }
        
        //prevent the nav bar from showing when we segue back to this VC
        self.navigationController?.navigationBar.isHidden = true
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
            //MARK:- Create activity indicator, using extension method
            let activityIndicator = pauseAndDisplayActivityIndicator()
            
            PFUser.logInWithUsername(inBackground: userLogin, password: userPassword) { (user, error) in
                if user != nil {
                    //segue to user table vc
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    self.performSegue(withIdentifier: "toUserTableVC", sender: self)
                } else {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
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

