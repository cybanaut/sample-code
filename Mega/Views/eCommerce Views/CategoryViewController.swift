//
//  CategoryViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    let cellHeight : CGFloat = 150
    
    var categories : [Category]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        let category1 = Category(title: "T - Shirts", count: "33", image: "category-1")
        let category2 = Category(title: "Dresses", count: "25", image: "category-2")
        let category3 = Category(title: "Denim", count: "18", image: "category-3")
        let category4 = Category(title: "Accessories", count: "20", image: "category-4")
        
        categories = [category1, category2, category3, category4]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryCell
        
        let category = categories[indexPath.row % categories.count]
        
        cell.imageView.image = UIImage(named: category.image)
        cell.titleLabel.text = category.title
        cell.countLabel.text = "(" + category.count + ")"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
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
        var cellWidth = size.width
        
        if transitionToWide {
            cellWidth = size.width / 2
        }
        
        return cellWidth
    }
}


class Category {
    
    var title: String!
    var count: String!
    var image: String!
    
    init(title: String, count: String, image: String){
        self.title = title
        self.count = count
        self.image = image
    }
}