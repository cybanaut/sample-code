//
//  ProductScrollViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ProductScrollViewController : UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate {

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
    
    @IBOutlet var productCollectionView : UICollectionView!
    @IBOutlet var productCollectionLayout : UICollectionViewFlowLayout!
    
    @IBOutlet var otherItemsCollectionView : UICollectionView!
    @IBOutlet var otherItemsCollectionLayout : UICollectionViewFlowLayout!
    
    let productImageHeight: CGFloat = 300
    
    var relatedProducts : [Product]!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        productCollectionView.backgroundColor = UIColor(white: 0.92, alpha: 1.0)
        
        productCollectionLayout.minimumLineSpacing = 10
        productCollectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        productCollectionLayout.itemSize = CGSizeMake(productImageHeight - 15, productImageHeight - 15)
        
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
        
        otherItemsCollectionView.delegate = self
        otherItemsCollectionView.dataSource = self
        otherItemsCollectionView.backgroundColor = UIColor.clearColor()
        
        otherItemsCollectionLayout.minimumInteritemSpacing = 0
        otherItemsCollectionLayout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        otherItemsCollectionLayout.itemSize = CGSizeMake(cellWidth, cellWidth)
        
        let product1 = Product(title: "Espirit Shirt", price: "$45", image: "product-1")
        let product2 = Product(title: "Chaplin Memo Shirt", price: "$45", image: "product-2")
        let product3 = Product(title: "London/ NY Shirt", price: "$35", image: "product-3")
        let product4 = Product(title: "Retro Grey", price: "$65", image: "product-4")
        
        relatedProducts = [product1, product2, product3, product4]
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return productImageHeight
        } else if indexPath.row == 3 {
            return 120
        }else if indexPath.row == 4 {
            return 70
        }else if indexPath.row == 5 {
            return 400
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
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductImageCell", forIndexPath: indexPath) as! ProductImageCell
        
            cell.productImageView.image = UIImage(named: "product-1")
            return cell
        }else{
            
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
            
            let index = indexPath.row % relatedProducts.count
            let product = relatedProducts[index]
            cell.imageView.image = UIImage(named: product.image)
            cell.titleLabel.text = product.title
            cell.priceLabel.text = product.price

            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return 3
        }else{
            return relatedProducts.count
        }
    }
    
    func calcCellWidth(size: CGSize) -> CGFloat {
        let transitionToWide = size.width > size.height
        var cellWidth = size.width / 2
        
        if transitionToWide {
            cellWidth = size.width / 3
        }
        
        return cellWidth
    }
}