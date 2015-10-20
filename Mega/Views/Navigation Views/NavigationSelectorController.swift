//
//  NavigationSelectorController.swift
//  Mega
//
//  Created by Tope Abayomi on 18/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class NavigationSelectorController : UIViewController, UITableViewDelegate, UITableViewDataSource {

    var viewLinks : [ViewInfo]!
    @IBOutlet var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Side Navigation", segue: "presentSideNavigation", description: "Mini Slide Animation. Icons only"))
        viewLinks.append(ViewInfo(title: "Full Navigation", segue: "presentFullNavigation", description: "Full Pop-out Animation"))
        viewLinks.append(ViewInfo(title: "Table Navigation", segue: "presentTableNavigation", description: "Traditional Slide-Out Animation"))
        
        let rightItem = UIBarButtonItem(title: "DONE", style: .Plain, target: self, action: "doneTapped:")
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewLinks.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MetaCell") as! MetaCell
        
        let info = viewLinks[indexPath.row]
        cell.titleLabel.text = info.title
        cell.subtitleLabel.text = info.description
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("timelineNav", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! TimelineViewController
        
        let indexPath = tableView.indexPathForSelectedRow
        let info = viewLinks[indexPath!.row]
        controller.nagivationStyleToPresent = info.segue
    }

    
    func doneTapped(sender: AnyObject?){
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}