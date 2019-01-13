//
//  UIViewController+Extension.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/12/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            
            //self.dismiss(animated: true, completion: nil)
        }))

        present(alert, animated: true, completion: nil)
    }
    
    func pauseAndDisplayActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: view.center.x - 25, y: view.center.y + 100, width: 50, height: 50))
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .gray
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        return activityIndicator
    }
}


