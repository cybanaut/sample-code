//
//  ProductDetailViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailViewController : UITableViewController {
    
    @IBOutlet var productImageView : UIImageView!
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var stockLabel : UILabel!
    @IBOutlet var priceLabel : UILabel!
    @IBOutlet var saleLabel  : UILabel!
    
    @IBOutlet var colorContainerView  : UIView!
    @IBOutlet var sizeContainerView  : UIView!
    @IBOutlet var spacerView  : UIView!
    
    @IBOutlet var sizeLabel  : UILabel!
    @IBOutlet var colorLabel  : UILabel!
    @IBOutlet var sizeValueLabel  : UILabel!
    @IBOutlet var colorValueLabel  : UILabel!

    @IBOutlet var descriptionLabel  : UILabel!
    @IBOutlet var orderButton  : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        productImageView.image = UIImage(named: "product-1")
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.text = "Armani Jeans Shirt"
        
        stockLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        stockLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        stockLabel.text = "Availability: In Stock"
        
        saleLabel.font = UIFont(name: MegaTheme.fontName, size: 11)
        saleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        let salePrice = NSMutableAttributedString(string: "$177")
        salePrice.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, salePrice.length))
        saleLabel.attributedText = salePrice

        priceLabel.font = UIFont(name: MegaTheme.fontName, size: 15)
        priceLabel.textColor = UIColor.blueColor()
        priceLabel.text = "$144"
        
        colorContainerView.backgroundColor = UIColor.whiteColor()
        sizeContainerView.backgroundColor = UIColor.whiteColor()
        spacerView.backgroundColor = UIColor(white: 0.7, alpha: 1.0)
        
        colorLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorLabel.textColor = UIColor.blackColor()
        colorLabel.text = "Color"
        
        sizeLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeLabel.textColor = UIColor.blackColor()
        sizeLabel.text = "Size"
        
        sizeValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        sizeValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        sizeValueLabel.text = "M"
        
        colorValueLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        colorValueLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        colorValueLabel.text = "Blue"
        
        descriptionLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        descriptionLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        descriptionLabel.text = "Long sleeve striped Armani Shirt in Dark Colors. Blue sky from the Armani Jeans Collection Line. 100% Cotton and High grade Polyester. Order today to get free shipping"
        
        orderButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        orderButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        orderButton.setTitle("ADD TO CART", forState: .Normal)
        orderButton.backgroundColor = UIColor(red: 0.14, green: 0.71, blue: 0.32, alpha: 1.0)
        orderButton.layer.cornerRadius = 20
        orderButton.layer.borderWidth = 0;
        orderButton.clipsToBounds = true;
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 300
        } else if indexPath.row == 3 {
            return 120
        }else if indexPath.row == 4 {
            return 70
        }else{
            return 45
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.selectionStyle = .None
    }
    
    override func viewDidLayoutSubviews() {
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
    }
}