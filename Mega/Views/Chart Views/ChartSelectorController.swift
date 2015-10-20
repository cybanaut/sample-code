//
//  ChartSelectorController.swift
//  Mega
//
//  Created by Tope Abayomi on 28/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ChartSelectorController: UITableViewController {
    
    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Bar Chart View", segue: "barchart", description: "Display a Bar chart with a gradient fill"))
        viewLinks.append(ViewInfo(title: "Progress Chart View", segue: "progresschart", description: "Display a Pie chart with a gradient fill"))
        viewLinks.append(ViewInfo(title: "Map View", segue: "map", description: "Great for displaying events etc."))
        viewLinks.append(ViewInfo(title: "Line Chart", segue: "linechart", description: "Display a data series"))
        
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
