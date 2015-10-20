//
//  eCommerceSelectorController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import UIKit

class eCommerceSelectorController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    
    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Shop", segue: "shop" ,description: "Grid of product images. With a Blur Effect"))
        viewLinks.append(ViewInfo(title: "Categories", segue: "category", description: "Rows of images. With a Transparent Effect"))
        viewLinks.append(ViewInfo(title: "Cart", segue: "cart", description: "Rows of shopping cart items with product details"))
        viewLinks.append(ViewInfo(title: "Product Detail", segue: "productdetail", description: "Product details. Large image with description and info"))
        viewLinks.append(ViewInfo(title: "Product Scroll Detail", segue: "productscroll", description: "Product details with Scrollable images."))
        viewLinks.append(ViewInfo(title: "Order Info", segue: "order", description: "Configurable Table of Order details"))
        viewLinks.append(ViewInfo(title: "Shipping Detail", segue: "orderdetail", description: "Credit Card, CCV and Shipping Info"))
        
        let rightItem = UIBarButtonItem(title: "DONE", style: .Plain, target: self, action: "doneTapped:")
        navigationItem.rightBarButtonItem = rightItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let info = viewLinks[indexPath.row]
        self .performSegueWithIdentifier(info.segue, sender: self)
    }
    
    func doneTapped(sender: AnyObject?){
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
}
