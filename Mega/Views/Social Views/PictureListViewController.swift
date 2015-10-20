//
//  PictureListViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 16/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit

class PictureListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tabSegmentControl : ADVTabSegmentControl!
    @IBOutlet var tableView : UITableView!
    
    var people : [Person]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        title = "People"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        tabSegmentControl.items = ["People", "Friends", "Requests"]
        
        let person1 = Person(name: "Linda Cristofssen", profilePicUrl: "people-profile-1", backgroundPicUrl: "people-pic-1", location: "London, UK", commentCount: "3")
        
        let person2 = Person(name: "Christopher Bale", profilePicUrl: "people-profile-2", backgroundPicUrl: "people-pic-2", location: "Sacramento, CA", commentCount: "20")
        
        let person3 = Person(name: "Angelina Jolie", profilePicUrl: "people-profile-3", backgroundPicUrl: "people-pic-3", location: "Los Angeles, CA", commentCount: "21")
        
        let person4 = Person(name: "Tom Cruise", profilePicUrl: "people-profile-4", backgroundPicUrl: "people-pic-4", location: "Seattle, WA", commentCount: "46")
        
        let person5 = Person(name: "Adam Sandler", profilePicUrl: "people-profile-5", backgroundPicUrl: "people-pic-5", location: "New York, NY", commentCount: "31")
        
        people = [person1, person2, person3, person4, person5]
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PictureCell") as! PictureCell
        
        let person = people[indexPath.row]
        
        cell.nameLabel.text = person.name
        cell.profileImageView.image = UIImage(named: person.profilePicUrl)
        cell.bgImageView.image = UIImage(named: person.backgroundPicUrl)
        cell.locationLabel.text = person.location
        cell.commentsLabel.text = "\(person.commentCount) Comments"
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
}


class Person {
    
    var name : String
    var profilePicUrl : String
    var backgroundPicUrl : String
    var location : String
    var commentCount : String
    
    init(name: String, profilePicUrl: String, backgroundPicUrl: String, location: String, commentCount: String){
     
        self.name = name
        self.profilePicUrl = profilePicUrl
        self.backgroundPicUrl = backgroundPicUrl
        self.location = location
        self.commentCount = commentCount
    }
}