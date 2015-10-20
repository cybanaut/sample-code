//
//  AlbumGridController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class AlbumGridController : UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var layout : UICollectionViewFlowLayout!
    
    var albums : [Album]!
    var cellHeight : CGFloat = 240
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Albums"
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let cellWidth = calcCellWidth(self.view.frame.size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        
        
        let album1 = Album(title: "Happiness", artist: "Hurts", coverImageUrl: "cover-album-1", songCount: 14)
        let album2 = Album(title: "Mylo Xyloto", artist: "Coldplay", coverImageUrl: "cover-album-6", songCount: 14)
        let album3 = Album(title: "Gold Dust", artist: "John Newman", coverImageUrl: "cover-album-5", songCount: 14)
        let album4 = Album(title: "Science and Faith", artist: "The Script", coverImageUrl: "cover-album-4", songCount: 14)
        let album5 =  Album(title: "Ultraviolence", artist: "Lana Del Rey", coverImageUrl: "cover-album-3", songCount: 14)
        let album6 = Album(title: "Exile", artist: "Hurts", coverImageUrl: "cover-album-2", songCount: 14)
        
        albums = [album1, album2, album3, album4, album5, album6]
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AlbumCell", forIndexPath: indexPath) as! AlbumCell
        
        let album = albums[indexPath.row]
        
        cell.titleLabel.text = album.title
        cell.artistLabel.text = album.artist
        cell.songCountLabel.text = "\(album.songCount) SONGS"
        cell.coverImageView.image = UIImage(named: album.coverImageUrl)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("detail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "detail"){
            
            let selectedItems : NSArray = collectionView.indexPathsForSelectedItems()!
            
            let selectedIndexPath : NSIndexPath = selectedItems[0] as! NSIndexPath
            let album = albums[selectedIndexPath.row]
            
            let controller = segue.destinationViewController as! PlayerListController
            controller.album = album
        }
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        let cellWidth = calcCellWidth(size)
        layout.itemSize = CGSizeMake(cellWidth, cellHeight)
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


class Album {
    var title : String
    var coverImageUrl : String
    var artist : String
    var songCount : Int
    var tracks = [Track]()
    
    init(title: String, artist: String, coverImageUrl : String, songCount: Int){
        self.title = title
        self.artist = artist
        self.coverImageUrl = coverImageUrl
        self.songCount = songCount
    }
}

class Track {
    var name : String
    var duration : String
    var filename : String
    
    
    init(name: String, duration: String, filename: String){
        self.name = name
        self.duration = duration
        self.filename = filename
    }
}