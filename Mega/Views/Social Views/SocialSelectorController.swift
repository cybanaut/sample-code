//
//  eCommerceSelectorController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import UIKit

class SocialSelectorController: UITableViewController {
    
    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Profile View", segue: "profile", description: "Show Social Stats for the User, Photos and More"))
        viewLinks.append(ViewInfo(title: "User Account View", segue: "account", description: "Show Account Info and Login details"))
        viewLinks.append(ViewInfo(title: "User Timeline View", segue: "timeline", description: "Good to show News Feed and Image updates"))
        viewLinks.append(ViewInfo(title: "Article/Blog Post View", segue: "article", description : "With Featured images and Author details"))
        viewLinks.append(ViewInfo(title: "Sign In/Log In  View", segue: "signin", description : "Perfect for getting users signed into your app"))
        viewLinks.append(ViewInfo(title: "Picture Table View", segue: "picture", description : "Image-Centric Table View. Good for displaying Contacts/Friends etc"))
        viewLinks.append(ViewInfo(title: "Social Accounts/ Icons", segue: "social", description : "Icons for Social Networks/Connections"))
       
        let rightItem = UIBarButtonItem(title: "DONE", style: .Plain, target: self, action: "doneTapped:")
        navigationItem.rightBarButtonItem = rightItem
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewLinks.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MetaCell") as! MetaCell
        
        let info = viewLinks[indexPath.row]
        cell.titleLabel.text = info.title
        cell.subtitleLabel.text = info.description
        
        return cell;
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = viewLinks[indexPath.row]
        self .performSegueWithIdentifier(info.segue, sender: self)
    }
    
    func doneTapped(sender: AnyObject?){
        
        dismissViewControllerAnimated(true, completion:nil)
    }
}
