//
//  CreatePasswordViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class CreatePasswordViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK:- Properties
    var user: PFUser?
    var signUpWasSuccessful = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- IBActions
 

    
    @IBAction func nextButtonTapped(_ sender: Any) {
        //assuming the password meets the requirements, pass the user to the success screen
        guard let password = passwordTextField.text else { return }
        
        //MARK:- activity indicator, using extension method
        let activityIndicator = pauseAndDisplayActivityIndicator()
        
        if password != "" {
            user?.password = password
            user?.signUpInBackground { (success, error) in
                if let error = error {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    self.displayAlert(title: "Unable to complete sign-up", message: error.localizedDescription)
                } else {
                    activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toNewUserWelcomeVC", sender: nil)
                    }
                }
            }
        } else {
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            displayAlert(title: "Invalid password", message: "Please enter a valid password")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toNewUserWelcomeVC" {
                if let destinationVC = segue.destination as? NewUserWelcomeViewController {
                    destinationVC.user = user
                }
            }
    }
    
    @IBAction func returnToSignInScreen(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
