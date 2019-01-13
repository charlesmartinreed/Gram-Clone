//
//  NewUserWelcomeViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class NewUserWelcomeViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //MARK: Properties
    var user: PFUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newUser = user {
            welcomeLabel.text = "Welcome to Instagram, \(newUser.username!)"
        }
        
    }
    

    //MARK:- IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {
        //sign up is complete, send user to home screen
        performSegue(withIdentifier: "toHomeScreen", sender: user)
    }
    
    @IBAction func changeUsernameButtonTapped(_ sender: UIButton) {
        //TODO: Implement this feature
        //might make sense to make this a public func since this will be useable in a lot of different situations...
    }
    
    //peform segue func here
    
}
