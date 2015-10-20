//
//  ShopViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class ShopViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    let cellHeight : CGFloat = 200
    
    var products : [Product]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        

        let rightBarItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .Plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightBarItem
        
        title = "T-Shirts"
        
        let product1 = Product(title: "Espirit Shirt", price: "$45", image: "product-1")
        let product2 = Product(title: "Chaplin Memo Shirt", price: "$45", image: "product-2")
        let product3 = Product(title: "London/ NY Shirt", price: "$35", image: "product-3")
        let product4 = Product(title: "Retro Grey", price: "$65", image: "product-4")
        let product5 = Product(title: "Hadncrafted Tee", price: "$25", image: "product-5")
        let product6 = Product(title: "Denim Rollup Shirt", price: "$55", image: "product-6")
        
        products = [product1, product2, product3, product4, product5, product6]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        let index = indexPath.row % products.count
        let product = products[index]
        cell.imageView.image = UIImage(named: product.image)
        cell.titleLabel.text = product.title
        cell.priceLabel.text = product.price
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        cell.setCellSelected(true)
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        cell.setCellSelected(false)
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var headerView : UICollectionReusableView!
        
        if kind == "UICollectionElementKindSectionHeader"{
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ShopHeaderView", forIndexPath: indexPath) as UICollectionReusableView
            
            let headerTitleLabel = headerView.viewWithTag(1) as! UILabel
            headerTitleLabel.font = UIFont(name: MegaTheme.fontName, size: 14)
            headerTitleLabel.textColor = UIColor(white: 0.4, alpha: 1.0)
            
            headerTitleLabel.text = "NEW ARRIVALS"
            
        }
        return headerView
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        let cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, 200)
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

class Product {

    var title : String!
    var image : String!
    var price : String!
    
    init(title: String, price : String, image: String){
        self.title = title
        self.price = price
        self.image = image
    }
}

