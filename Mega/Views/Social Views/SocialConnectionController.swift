//
//  SocialConnectionController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class SocialConnectionController : UITableViewController {
   
    var connections : [Dictionary<String, String>]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Connections"

        tableView.rowHeight = 44;
        
        let connection1 = ["name" : "Facebook", "icon" : "social-facebook"]
        let connection2 = ["name" : "Twitter", "icon" : "social-twitter"]
        let connection3 = ["name" : "Instagram", "icon" : "social-instagram"]
        let connection4 = ["name" : "Google+", "icon" : "social-google"]
        let connection5 = ["name" : "LinkedIn", "icon" : "social-linkedin"]
        
        connections = [connection1, connection2, connection3, connection4, connection5]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ConnectionCell") as! ConnectionCell
        
        let connection = connections[indexPath.row]
        
        cell.iconImageView.image = UIImage(named: connection["icon"]!)
        cell.titleLabel.text = connection["name"]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connections.count
    }
}