//
//  BartChartController.swift
//  Mega
//
//  Created by Tope Abayomi on 28/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class BarChartController : UITableViewController, JBBarChartViewDataSource, JBBarChartViewDelegate {
    
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var backButton : UIButton!
    @IBOutlet var topImageView : UIImageView!
    @IBOutlet var salesLabel : UILabel!
    @IBOutlet var salesValue : UILabel!
    
    @IBOutlet var segmentControl : ADVSegmentedControl!
    
    @IBOutlet var tabSegmentControl : ADVTabSegmentControl!
    
    @IBOutlet var chartContentView : UIView!
    
    var chartData : [CGFloat]!
    var monthlySymbols : [String]!
    var barChartView : JBBarChartView!
    
    var chartHeight : CGFloat = 200
    var chartFontSize : CGFloat = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .None
        
        titleLabel.font = UIFont(name: MegaTheme.fontName, size: 21)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "Statistics"
        
        salesLabel.font = UIFont(name: MegaTheme.boldFontName, size: 16)
        salesLabel.textColor = UIColor(red: 0.27, green: 0.80, blue: 0.34, alpha: 1.0)
        salesLabel.text = "SALES"
        
        salesValue.font = UIFont(name: MegaTheme.boldFontName, size: 30)
        salesValue.textColor = UIColor.whiteColor()
        salesValue.text = "$81,694"
        
        topImageView.image = UIImage(named: "stats-bg")
        topImageView.clipsToBounds = true
        topImageView.contentMode = .ScaleAspectFill
        
        let backImage = UIImage(named: "back")?.imageWithRenderingMode(.AlwaysTemplate)
        backButton.setImage(backImage, forState: .Normal)
        backButton.tintColor = UIColor.whiteColor()
        backButton.addTarget(self, action: "backTapped:", forControlEvents: .TouchUpInside)
        
        
        segmentControl.items = ["WEEKLY", "MONTHLY", "YEARLY"]
        segmentControl.font = UIFont(name: MegaTheme.boldFontName, size: 12)
        segmentControl.borderColor = UIColor(white: 1.0, alpha: 0.3)
        segmentControl.selectedIndex = 1
        segmentControl.addTarget(self, action: "segmentValueChanged:", forControlEvents: .ValueChanged)

        tabSegmentControl.items = ["WEEKLY", "MONTHLY", "YEARLY"]
        tabSegmentControl.font = UIFont(name: MegaTheme.boldFontName, size: 12)
        tabSegmentControl.selectedIndex = 2
        tabSegmentControl.addTarget(self, action: "tabSegmentValueChanged:", forControlEvents: .ValueChanged)
        
        chartData = [18, 35, 30, 67, 60, 60, 128, 70, 50, 40, 44, 20, 60, 128, 70, 50, 40, 44, 20]
        monthlySymbols = NSDateFormatter().shortMonthSymbols as [String]

    }
    
    override func viewDidAppear(animated: Bool) {
        setupBarChart()
    }
    
    func setupBarChart() {
        
        let width = view.frame.size.width
        
        barChartView = JBBarChartView()
     
        barChartView.frame = CGRectMake(0, 0, width, width)
        
        barChartView.delegate = self
        barChartView.dataSource = self
        barChartView.headerPadding = 10.0
        barChartView.minimumValue = 0.0
        barChartView.inverted = false
        barChartView.backgroundColor = UIColor.whiteColor()
        
        chartContentView.addSubview(barChartView)
        
        let angle : CGFloat = CGFloat(M_PI) * 0.5
        let transform = CGAffineTransformMakeRotation(angle)
        
        self.barChartView.transform = transform
        
        barChartView.reloadData()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 50;
        }else if indexPath.row == 2 {
            return chartHeight + 50;
        }else{
            return 200
        }
    }
    
    // #pragma mark - JBBarChartViewDelegate
    
    func barChartView(barChartView: JBBarChartView!, heightForBarViewAtIndex index: UInt) -> CGFloat {
        let data : CGFloat = chartData[Int(index)]
        return data
    }
    
    func barChartView(barChartView: JBBarChartView!, barViewAtIndex index: UInt) -> UIView! {
        return createViewForBarChartAtIndex(Int(index))
    }
    
    func barSelectionColorForBarChartView(barChartView: JBBarChartView!) -> UIColor! {
        return UIColor.whiteColor()
    }
    
    func barPaddingForBarChartView(barChartView: JBBarChartView!) -> CGFloat {
        return 1.0
    }
    
    // #pragma mark - JBBarChartViewDataSource
    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
        return UInt(chartData.count)
    }
    
    // #pragma mark - JBChartViewDataSource
    func shouldExtendSelectionViewIntoHeaderPaddingForChartView(chartView: JBChartView!) -> Bool {
        return true
    }
    
    func shouldExtendSelectionViewIntoFooterPaddingForChartView(chartView: JBChartView!) -> Bool {
        return false
    }
    
    func backTapped(sender: AnyObject?){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func createViewForBarChartAtIndex(index: Int) -> UIView {
        
        let barView = BarView(frame: CGRectMake(0, 0, 20, 100))
        
        let startColor = UIColor(red: 0.35, green: 0.86, blue: 0.75, alpha: 1.0).CGColor
        let endColor = UIColor(red: 0.31, green: 0.67, blue: 0.90, alpha: 1.0).CGColor
        barView.gradientLayer = CAGradientLayer()
        barView.gradientLayer?.frame = barView.bounds
        barView.gradientLayer?.colors = [startColor, endColor]
        barView.gradientLayer?.locations = [0.0, 0.5]
        
        barView.layer.insertSublayer(barView.gradientLayer!, atIndex: 0)
        
        
        let label = UILabel(frame: CGRectMake(0, 10, 20, 20))
        label.font = UIFont(name: MegaTheme.boldFontName, size: chartFontSize)
        label.textColor = UIColor.whiteColor()
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let textToDisplay : Int = Int(chartData[index])
        label.text = "\(textToDisplay)"
        
        let angle : CGFloat = CGFloat(M_PI) * -0.5
        label.transform = CGAffineTransformMakeRotation(angle)
        
        barView.addSubview(label)
        
        let topConstraint = NSLayoutConstraint(item: barView , attribute: .Top, relatedBy: .Equal, toItem: label, attribute: .Top, multiplier: 1.0, constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: barView , attribute: .Right, relatedBy: .Equal, toItem: label, attribute: .Right, multiplier: 1.0, constant: 0)
        
        let leftConstraint = NSLayoutConstraint(item: barView , attribute: .Left, relatedBy: .Equal, toItem: label, attribute: .Left, multiplier: 1.0, constant: 0)
        
        let heightConstraint = NSLayoutConstraint(item: label , attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50)
        
        barView.addConstraints([topConstraint, leftConstraint, rightConstraint])
        label.addConstraint(heightConstraint)
        
        return barView
    }
    
    func segmentValueChanged(sender: AnyObject?){
        
        if segmentControl.selectedIndex == 0 {
            salesValue.text = "$23,399"
        }else if segmentControl.selectedIndex == 1{
            salesValue.text = "$81,295"
        }else{
            salesValue.text = "$199,392"
        }
    }
    
    func tabSegmentValueChanged(sender: AnyObject?){
     
        if tabSegmentControl.selectedIndex == 0 {
            chartData = [70, 50, 20, 60, 128, 70, 50, 40, 4, 20, 60, 128, 70, 50, 40, 44, 20]
        }else if tabSegmentControl.selectedIndex == 1{
            chartData = [18, 35, 30, 67, 60, 60, 128, 70, 50, 40, 44, 20, 60, 128, 70, 50, 40, 44, 20]
        }else{
            chartData = [128, 70, 50, 70, 50, 20, 60, 128, 70, 50, 70, 50, 20, 60, 128, 70, 50,]
        }
        
        barChartView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

class BarView: UIView {
    
    var gradientLayer : CAGradientLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = self.bounds
    }
}


