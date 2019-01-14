//
//  UserTableViewController.swift
//  Do It For The Gram
//
//  Created by Charles Martin Reed on 1/13/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Parse

class UserTableViewController: UITableViewController {

    //MARK:- Properties
    var currentUser = PFUser.current()
    var usernames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Welcome, \(currentUser?.username ?? "Stranger!")")
        getUsernamesFromParseServer()
    }
    
    func getUsernamesFromParseServer() {
        //make a user query, initially grabbing them all
        let query = PFUser.query()
        
        //query where to find all the users except for the current one
        query?.whereKey("username", notEqualTo: currentUser?.username)
        
        query?.findObjectsInBackground(block: { (users, error) in
            if let err = error {
                self.displayAlert(title: "Uh-oh!", message: err.localizedDescription)
            } else if let users = users {
                //unwrap and loop through - note that these are returned as objects, not PFUser
                users.forEach({ (object) in
                    if let user = object as? PFUser {
                        if let username = user.username {
                            self.usernames.append(username)
                        }
                    }
                })
                
                self.tableView.reloadData()
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usernames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = usernames[indexPath.row]
        
        return cell
    }
    
    //MARK:- IBAction
    @IBAction func logoutUser(_ sender: Any) {
        //logout the user and segue back to the home screen
        PFUser.logOut()
        
        performSegue(withIdentifier: "logoutSegue", sender: self)
        
    }
    
}
