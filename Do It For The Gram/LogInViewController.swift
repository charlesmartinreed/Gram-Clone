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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTestCommentForParse()
    }

    //create a retrieve a tweet
    private func createTestCommentForParse() {
        
        //PFObjects use classNames for grouping comment elements
        let comment = PFObject(className: "Comment")
        
        comment["text"] = "I love this photo so much!"
        //saveEventually can hold off on saving if internet connectivity is not available at time of save
        comment.saveInBackground { (success, error) in
            if success {
               print("save successful")
            } else {
                print("save failed")
            }
        }
        
        retrieveCommentsForUser()
    }
    
    private func retrieveCommentsForUser() {
        let query = PFQuery(className: "Comment")
        
        query.getObjectInBackground(withId: "A5BWZHBee1") { (object, error) in
            if let comment = object {
                //if we're here, we've got a comment
                if let text = comment["text"] {
                    print(text as? String ?? "")
                }
            }
        }
    }

}

