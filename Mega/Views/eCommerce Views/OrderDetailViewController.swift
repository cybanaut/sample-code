//
//  OrderDetailViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class OrderDetailViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var lastnameTextField: UITextField!
    
    @IBOutlet var cardLabel: UILabel!
    @IBOutlet var cardTextField: UITextField!
    @IBOutlet var cvvLabel: UILabel!
    @IBOutlet var cvvTextField: UITextField!
    
    @IBOutlet var expirationLabel: UILabel!
    @IBOutlet var expirationTextfieldMonth: UITextField!
    @IBOutlet var expirationTextfieldYear: UITextField!
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var stateTextField: UITextField!
    @IBOutlet var zipCodeLabel: UILabel!
    @IBOutlet var zipCodeTextField: UITextField!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var countryTextField: UITextField!
    
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var commentTextView: UITextView!
    
    @IBOutlet var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        themeLabelWithText(nameLabel, text: "FIRST NAME")
        themeTextFieldWithText(nameTextField, text: "John")
        
        themeLabelWithText(lastnameLabel, text: "LAST NAME")
        themeTextFieldWithText(lastnameTextField, text: "Harrison")
        
        themeLabelWithText(cardLabel, text: "CARD NUMBER")
        themeTextFieldWithText(cardTextField, text: "2222111133339999")
        
        themeLabelWithText(cvvLabel, text: "CVV")
        themeTextFieldWithText(cvvTextField, text: "4567")
       
        themeLabelWithText(expirationLabel, text: "EXPIRATION")
        themeTextFieldWithText(expirationTextfieldMonth, text: "4")
        themeTextFieldWithText(expirationTextfieldYear, text: "2016")
        
        themeLabelWithText(cityLabel, text: "CITY")
        themeTextFieldWithText(cityTextField, text: "Houston")
        
        themeLabelWithText(stateLabel, text: "STATE")
        themeTextFieldWithText(stateTextField, text: "Texas")
        
        themeLabelWithText(zipCodeLabel, text: "ZIP CODE")
        themeTextFieldWithText(zipCodeTextField, text: "22112")
        
        themeLabelWithText(countryLabel, text: "COUNTRY")
        themeTextFieldWithText(countryTextField, text: "United States")
        
        themeLabelWithText(commentLabel, text: "COMMENT")
        
        commentTextView.font = UIFont(name: MegaTheme.fontName, size: 10)
        commentTextView.textColor = MegaTheme.darkColor
        commentTextView.text = "Please leave a comment here"
        
        orderButton.titleLabel?.font = UIFont(name: MegaTheme.boldFontName, size: 18)
        orderButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        orderButton.setTitle("PLACE ORDER", forState: .Normal)
        orderButton.backgroundColor = UIColor(red: 0.14, green: 0.71, blue: 0.69, alpha: 1.0)
        orderButton.layer.cornerRadius = 20
        orderButton.layer.borderWidth = 0;
        orderButton.clipsToBounds = true;
    }
    
    func themeTextFieldWithText(textField:UITextField, text: String){
        let largeFontSize : CGFloat = 17
        textField.font = UIFont(name: MegaTheme.fontName, size: largeFontSize)
        textField.textColor = MegaTheme.darkColor
        textField.text = text
        textField.delegate = self
    }
    
    func themeLabelWithText(label: UILabel, text: String){
        let fontSize : CGFloat = 10
        label.font = UIFont(name: MegaTheme.fontName, size: fontSize)
        label.textColor = MegaTheme.lightColor
        label.text = text
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.deregisterFromKeyboardNotifications()
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 120
        }else if indexPath.row == 6 {
            return 80
        }
        return 60
    }
    
    func registerForKeyboardNotifications ()-> Void   {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWasShown:", name: UIKeyboardDidShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillBeHidden:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func deregisterFromKeyboardNotifications () -> Void {
        let center:  NSNotificationCenter = NSNotificationCenter.defaultCenter()
        center.removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
        center.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification) {
        
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue.size
        let insets: UIEdgeInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0, keyboardSize!.height, 0)
        
        self.tableView.contentInset = insets
        self.tableView.scrollIndicatorInsets = insets
        
        self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + keyboardSize!.height)
    }
    
    func keyboardWillBeHidden (notification: NSNotification) {
        
        let info : NSDictionary = notification.userInfo!
        let keyboardSize = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue.size
        let insets: UIEdgeInsets = UIEdgeInsetsMake(self.tableView.contentInset.top, 0, keyboardSize!.height, 0)
        
        self.tableView.contentInset = insets
        self.tableView.scrollIndicatorInsets = insets
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
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