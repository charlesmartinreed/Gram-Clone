//
//  SignUpViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var phoneEmailSegControl: UISegmentedControl!
    @IBOutlet weak var phoneEmailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK:- IBActions
    @IBAction func signUpNextScreenButtonTapped(_ sender: UIButton) {
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
        //self.view.window?.rootViewController?.presentedViewController!.dismiss(animated: true, completion: nil)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddNameVC", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
