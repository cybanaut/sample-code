//
//  CartViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class CartViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var totalLabel : UILabel!
    @IBOutlet var totalTitle : UILabel!
    @IBOutlet var orderButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        totalTitle.font = UIFont(name: MegaTheme.fontName, size: 15)
        totalTitle.textColor = UIColor.blackColor()
        totalTitle.text = "TOTAL"
        
        totalLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        totalLabel.textColor = UIColor.blackColor()
        totalLabel.text = "$135"
        
        orderButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        orderButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        orderButton.setTitle("PLACE ORDER", forState: .Normal)
        orderButton.backgroundColor = UIColor(red: 0.14, green: 0.71, blue: 0.32, alpha: 1.0)
        orderButton.layer.cornerRadius = 20
        orderButton.layer.borderWidth = 0;
        orderButton.clipsToBounds = true;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell") as! CartCell
        
        cell.productImageView.image = UIImage(named: "product-1")
        cell.titleLabel.text = "Espirit Shirt (Men)"
        cell.detailsLabel.text = "Size: M, Color: White"
        cell.priceLabel.text = "$45"
        cell.quantityTextField.text = "1"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}