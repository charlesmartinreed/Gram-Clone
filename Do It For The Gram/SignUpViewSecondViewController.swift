//
//  SignUpViewSecondViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class SignUpViewSecondViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var fullNameTextField: UITextField!
    
    //MARK:- Properties
    var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    //MARK:- IBActions

    @IBAction func nextButtonTapped(_ sender: Any) {
        //continue to the Create a Password screen
        guard let fullName = fullNameTextField.text else { return }
        
        if fullName != "" {
            user?.username = fullName
            performSegue(withIdentifier: "toCreatePasswordVC", sender: nil)
        } else {
            displayAlert(title: "Invalid username", message: "Please enter a valid username")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toCreatePasswordVC" {
                if let destinationVC = segue.destination as? CreatePasswordViewController {
                    destinationVC.user = user
                }
        }
    }
    
    
    @IBAction func returnToSignInScreen(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
