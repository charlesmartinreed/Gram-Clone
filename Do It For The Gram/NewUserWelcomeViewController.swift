//
//  NewUserWelcomeViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class NewUserWelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBActions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        //sign up is complete, send user to home screen
        performSegue(withIdentifier: "toHomeScreen", sender: nil)
    }
    
    @IBAction func changeUsernameButtonTapped(_ sender: UIButton) {
        //TODO: Implement this feature
        //might make sense to make this a public func since this will be useable in a lot of different situations...
    }
    
}
