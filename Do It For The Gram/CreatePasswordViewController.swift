//
//  CreatePasswordViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class CreatePasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBActions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //assuming the password meets the requirements, pass the user to the success screen
        performSegue(withIdentifier: "toNewUserWelcomeVC", sender: nil)
    }
    
    @IBAction func returnToSignInScreen(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}
