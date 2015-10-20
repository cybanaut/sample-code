//
//  ViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "eCommerce Views", segue: "eCommerce", description: "for Shopping Carts, Product Images, Grids and Tables"))
        viewLinks.append(ViewInfo(title: "Navigation Views", segue: "Navigation", description: "Navigation using Animated Transitions"))
        viewLinks.append(ViewInfo(title: "Social Views", segue: "Social", description: "Timelines, User Profiles and more"))
        viewLinks.append(ViewInfo(title: "Graphs/Charts Views", segue: "Charts", description: "Bar/Pie/Line Charts, Animated and Beautiful:-)"))
        viewLinks.append(ViewInfo(title: "Media (Music Player Controls)", segue: "Media", description: "Albums Grids, Music Player Controls and more.. "))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        if(info.segue != "none"){
            let storyboard = UIStoryboard(name: info.segue, bundle: nil)
            let controller = storyboard.instantiateInitialViewController() as UIViewController!
            
            showViewController(controller, sender: self)

        }
    }
}

class ViewInfo {
    var title: String!
    var segue:  String!
    var description:  String!
    
    init(title: String, segue: String){
        self.title = title
        self.segue = segue
    }
    
    init(title: String, segue: String, description: String){
        self.title = title
        self.segue = segue
        self.description = description
    }
}

