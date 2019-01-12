//
//  AlertsViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/11/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class AlertsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- IBActions
    
    @IBAction func showAlert(_ sender: UIButton) {
        let ac = UIAlertController(title: "Hey!", message: "I hope you're having a wonderful day", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "It's alright", style: .default, handler: { (_) in
           
            print("An OK day is good enough.")
            
            self.dismiss(animated: true, completion: nil)
        }))
        
        ac.addAction(UIAlertAction(title: "Real shitty day, bro", style: .default, handler: { (_) in
            print("Shitty day confirmed.")
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(ac, animated: true, completion: nil)
    }
    
    @IBAction func pauseApp(_ sender: UIButton) {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center //at the center of screen
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.style = .gray //could also be white or white large
        
        view.addSubview(activityIndicator)
        
        //start the spinning animation
        activityIndicator.startAnimating()
        
        //stop the user from interacting with other elements while our spinner is going
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
}
