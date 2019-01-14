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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = currentUser?.username ?? "Username not available"
        
        return cell
    }
    
    //MARK:- IBAction
    @IBAction func logoutUser(_ sender: Any) {
        //logout the user and segue back to the home screen
        PFUser.logOut()
        
        performSegue(withIdentifier: "logoutSegue", sender: self)
        
    }
    
}
