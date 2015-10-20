//
//  NavigationTableController.swift
//  Mega
//
//  Created by Tope Abayomi on 20/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class NavigationTableController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var bgImageView : UIImageView!
    @IBOutlet var tableView   : UITableView!
    @IBOutlet var dimmerView  : UIView!
    @IBOutlet var bottomFillView  : UIView!
    
    @IBOutlet var nameLabel  : UILabel!
    @IBOutlet var locationLabel  : UILabel!
    @IBOutlet var locationImageView  : UIImageView!
    @IBOutlet var profileImageView  : UIImageView!
    @IBOutlet var logoutButton  : UIButton!
    
    var items : [NavigationModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor(white: 0.20, alpha: 1.0)
        
        let backgroundColor = UIColor(white: 0.15, alpha: 1.0)
        tableView.backgroundColor = backgroundColor
        bottomFillView.backgroundColor = backgroundColor
        
        bgImageView.image = UIImage(named: "nav-bg")
        dimmerView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        
        nameLabel.font = UIFont(name: MegaTheme.fontName, size: 19)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.text = "Linda Hoylett"
        
        locationLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        locationLabel.textColor = UIColor.whiteColor()
        locationLabel.text = "London, UK"
        
        profileImageView.image = UIImage(named: "profile-pic-1")
        profileImageView.layer.cornerRadius = 50
        
        locationImageView.image = UIImage(named: "location")
        
        logoutButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        logoutButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        logoutButton.setTitle("LOGOUT", forState: .Normal)
        logoutButton.backgroundColor = UIColor(red: 0.83, green: 0.18, blue: 0.21, alpha: 1.0)
        logoutButton.clipsToBounds = true;
        
        let item1 = NavigationModel(title: "MY ACCOUNT", icon: "icon-home")
        let item2 = NavigationModel(title: "COMMENTS", icon: "icon-chat", count: "3")
        let item3 = NavigationModel(title: "FAVORITES", icon: "icon-star")
        let item4 = NavigationModel(title: "SETTINGS", icon: "icon-filter")
        let item5 = NavigationModel(title: "ABOUT", icon: "icon-info")
        
        items = [item1, item2, item3, item4, item5]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("NavigationTableCell") as! NavigationTableCell
        
        let item = items[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.countLabel.text = item.count
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}


