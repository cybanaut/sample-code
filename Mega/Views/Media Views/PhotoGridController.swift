//
//  PhotoGridController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class PhotoGridController : UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var photos : [Dictionary<String, String>]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellWidth)
        
        let photo1 = ["photoUrl" : "grid-photo-1", "count" : "23"]
        let photo2 = ["photoUrl" : "grid-photo-2", "count" : "13"]
        let photo3 = ["photoUrl" : "grid-photo-3", "count" : "82"]
        let photo4 = ["photoUrl" : "grid-photo-4", "count" : "45"]
        let photo5 = ["photoUrl" : "grid-photo-5", "count" : "10"]
        let photo6 = ["photoUrl" : "grid-photo-6", "count" : "39"]
        let photo7 = ["photoUrl" : "grid-photo-7", "count" : "56"]
        let photo8 = ["photoUrl" : "grid-photo-8", "count" : "18"]
        let photo9 = ["photoUrl" : "grid-photo-9", "count" : "39"]
        
        photos = [photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
        
        let photo = photos[indexPath.row]

        cell.coverImageView.image = UIImage(named: photo["photoUrl"]!)
        cell.countLabel.text = photo["count"]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
   
    func calcCellWidth(size: CGSize) -> CGFloat {
        let cellWidth = size.width / 3
        return cellWidth
    }
}
