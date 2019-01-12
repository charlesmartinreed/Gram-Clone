//
//  SignUpViewSecondViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class SignUpViewSecondViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var fullNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBActions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //continue to the Create a Password screen
        performSegue(withIdentifier: "toCreatePasswordVC", sender: nil)
    }
    
    
    @IBAction func returnToSignInScreen(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
