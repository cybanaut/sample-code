//
//  MediaSelectorController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class MediaSelectorController: UITableViewController {
    
    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Album View", segue: "album", description: "A Grid of Album Covers and Metadata"))
        viewLinks.append(ViewInfo(title: "Player View", segue: "player", description: "Audio player with controls"))
        
        viewLinks.append(ViewInfo(title: "Photo View", segue: "photo", description: "A Grid of pictures and metadata"))
        
        
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
