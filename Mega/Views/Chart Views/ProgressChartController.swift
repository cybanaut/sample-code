//
//  ProgressChartController.swift
//  Mega
//
//  Created by Tope Abayomi on 02/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation

import UIKit

class ProgressChartController : UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var tabSegmenControl : ADVTabSegmentControl!
    
    @IBOutlet var collectionView : UICollectionView!
    @IBOutlet var collectionLayout : UICollectionViewFlowLayout!
    
    @IBOutlet var yearControl1 : ADVProgressControl!
    @IBOutlet var yearControl2 : ADVProgressControl!
    @IBOutlet var yearControl3 : ADVProgressControl!
    @IBOutlet var yearControl4 : ADVProgressControl!
    
    @IBOutlet var warmColorIndicator : UIView!
    @IBOutlet var warmColorLabel : UILabel!
    
    @IBOutlet var coldColorIndicator : UIView!
    @IBOutlet var coldColorLabel : UILabel!
    
    @IBOutlet var gradientButton : UIButton!
    
    var coldColorsStart : [UIColor]!
    var coldColorsEnd : [UIColor]!
    var warmColorsStart : [UIColor]!
    var warmColorsEnd : [UIColor]!
    
    var yearControls : [ADVProgressControl]!
    
    var revenueModel : [RevenueModel]!
    
    let progressSize : CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Revenue Targets"
        
        tableView.separatorColor = UIColor(white: 0.77, alpha: 1.0)
        
        tabSegmenControl.items = ["WEEKLY", "MONTHLY", "YEARLY"]
        tabSegmenControl.addTarget(self, action: "tabSegmentValueChanged:", forControlEvents: .ValueChanged)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionLayout.minimumLineSpacing = 100
        collectionLayout.minimumInteritemSpacing = 100
        collectionLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        collectionLayout.itemSize = CGSizeMake(progressSize, progressSize)
        collectionLayout.scrollDirection = .Horizontal
        
        yearControl1.labelFont = UIFont(name: MegaTheme.fontName, size: 11)
        yearControl2.labelFont = UIFont(name: MegaTheme.fontName, size: 11)
        yearControl3.labelFont = UIFont(name: MegaTheme.fontName, size: 11)
        yearControl4.labelFont = UIFont(name: MegaTheme.fontName, size: 11)
        yearControls = [yearControl1, yearControl2, yearControl3, yearControl4]
        
        createColdColors()
        createWarmColors()
        showColors(warmColorsStart, endColors: warmColorsEnd)
        
        warmColorIndicator.layer.cornerRadius = 10
        warmColorIndicator.layer.borderWidth = 3
        warmColorIndicator.layer.borderColor = UIColor(red: 1.0, green: 0.35, blue: 0.49, alpha: 1.0).CGColor
        
        warmColorLabel.text = "SHOW COLD COLORS"
        warmColorLabel.font = UIFont(name: MegaTheme.fontName, size: 16)
        
        coldColorIndicator.layer.cornerRadius = 10
        coldColorIndicator.layer.borderWidth = 3
        coldColorIndicator.layer.borderColor = UIColor(red: 0.48, green: 0.43, blue: 0.78, alpha: 1.0).CGColor
        
        coldColorLabel.text = "SHOW WARM COLORS"
        coldColorLabel.font = UIFont(name: MegaTheme.fontName, size: 16)
        
        revenueModel = yearlyRevenueModel()
        
        gradientButton.setTitle("GRADIENT COLOR BUTTON", forState: .Normal)
        gradientButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        gradientButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return revenueModel.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        
        let progressControl = cell.viewWithTag(1) as! ADVProgressControl
        
        let model = revenueModel[indexPath.row]
        
        progressControl.progress = model.percent
        progressControl.gradientStart = model.startColor
        progressControl.gradientEnd = model.endColor
        
        progressControl.labelText = model.title
        progressControl.labelFont = UIFont(name: MegaTheme.boldFontName, size: 45)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 54
            
        }else if indexPath.row == 1 {
            return progressSize * 1.5
            
        }else if indexPath.row == 2{
            return 80
        }else{
            return 55
        }
    }
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 3 {
            showColors(coldColorsStart, endColors: coldColorsEnd)
        }else if indexPath.row == 4 {
            showColors(warmColorsStart, endColors: warmColorsEnd)
        }
    }
    
    func tabSegmentValueChanged(sender : AnyObject?){
        
        if tabSegmenControl.selectedIndex == 0 {
            revenueModel = weeklyRevenueModel()
        }else if tabSegmenControl.selectedIndex == 1 {
            revenueModel = monthlyRevenueModel()
        }else{
            revenueModel = yearlyRevenueModel()
        }
        
        collectionView.reloadData()
    }
    
    func createColdColors(){
        
        let c11 = UIColor(red: 0.13, green: 0.79, blue: 0.98, alpha: 1.0)
        let c12 = UIColor(red: 0.09, green: 0.30, blue: 0.92, alpha: 1.0)
        
        let c21 = UIColor(red: 0.07, green: 0.33, blue: 0.85, alpha: 1.0)
        let c22 = UIColor(red: 0.85, green: 0.62, blue: 0.92, alpha: 1.0)
        
        let c31 = UIColor(red: 0.22, green: 0.64, blue: 0.89, alpha: 1.0)
        let c32 = UIColor(red: 0.25, green: 0.83, blue: 0.73, alpha: 1.0)
        
        let c41 = UIColor(red: 0.48, green: 0.43, blue: 0.78, alpha: 1.0)
        let c42 = UIColor(red: 0.16, green: 0.79, blue: 0.97, alpha: 1.0)
        
        coldColorsStart = [c11, c21, c31, c41]
        coldColorsEnd = [c12, c22, c32, c42]
    }
    
    func createWarmColors(){
        
        let c11 = UIColor(red: 0.99, green: 0.31, blue: 0.51, alpha: 1.0)
        let c12 = UIColor(red: 0.99, green: 0.55, blue: 0.38, alpha: 1.0)
        
        let c21 = UIColor(red: 0.88, green: 0.17, blue: 0.64, alpha: 1.0)
        let c22 = UIColor(red: 0.98, green: 0.76, blue: 0.04, alpha: 1.0)
        
        let c31 = UIColor(red: 1.0, green: 0.83, blue: 0.23, alpha: 1.0)
        let c32 = UIColor(red: 1.0, green: 0.51, blue: 0.03, alpha: 1.0)
        
        let c41 = UIColor(red: 0.84, green: 0.60, blue: 0.91, alpha: 1.0)
        let c42 = UIColor(red: 1.0, green: 0.17, blue: 0.43, alpha: 1.0)
        
        warmColorsStart = [c11, c21, c31, c41]
        warmColorsEnd = [c12, c22, c32, c42]
    }
    
    
    func showColors(startColors: [UIColor], endColors: [UIColor]) {
        
        for (index, control) in yearControls.enumerate() {
            control.gradientStart = startColors[index]
            control.gradientEnd = endColors[index]
        }
    }
    
    func weeklyRevenueModel() -> [RevenueModel]{
    
        let model1 = RevenueModel(title: "Q1", percent: 0.71, startColor: coldColorsStart[0], endColor: coldColorsEnd[0])
        
        let model2 = RevenueModel(title: "Q2", percent: 0.9, startColor: warmColorsStart[0], endColor: warmColorsEnd[0])
        
        let model3 = RevenueModel(title: "Q3", percent: 0.6, startColor: coldColorsStart[1], endColor: coldColorsEnd[1])
        
        let model4 = RevenueModel(title: "Q4", percent: 0.9, startColor: warmColorsStart[1], endColor: warmColorsEnd[1])
        
        return [model1, model2, model3, model4]
    }
    
    func monthlyRevenueModel() -> [RevenueModel]{
        
        let model1 = RevenueModel(title: "FEB 2015", percent: 0.9, startColor: warmColorsStart[1], endColor: warmColorsEnd[1])
        
        let model2 = RevenueModel(title: "MAR 2015", percent: 0.4, startColor: coldColorsStart[2], endColor: coldColorsEnd[2])
        
        let model3 = RevenueModel(title: "APR 2015", percent: 1.0, startColor: warmColorsStart[3], endColor: warmColorsEnd[3])
        
        return [model1, model2, model3]
    }
    
    func yearlyRevenueModel() -> [RevenueModel]{
        
        let model1 = RevenueModel(title: "2013", percent: 0.75, startColor: coldColorsStart[3], endColor: coldColorsEnd[3])
        
        let model2 = RevenueModel(title: "2014", percent: 0.8, startColor: warmColorsStart[1], endColor: warmColorsEnd[1])
        
        let model3 = RevenueModel(title: "2015", percent: 0.5, startColor: coldColorsStart[2], endColor: coldColorsEnd[2])
        
        return [model1, model2, model3]
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
    }
    
    override func viewDidLayoutSubviews() {
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
    }
}


class RevenueModel {
    
    var percent : CGFloat!
    var title : String!
    var startColor : UIColor!
    var endColor : UIColor!
    
    init(title: String, percent: CGFloat, startColor: UIColor, endColor: UIColor){
        self.title = title
        self.percent = percent
        self.startColor = startColor
        self.endColor = endColor
    }
}
