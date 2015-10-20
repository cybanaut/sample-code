//
//  MapEventController.swift
//  Mega
//
//  Created by Tope Abayomi on 08/12/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapEventController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    @IBOutlet var mapView : MKMapView!
    
    @IBOutlet var placeImageView : UIImageView!
    @IBOutlet var placeLabel : UILabel!
    @IBOutlet var addressLabel : UILabel!
    @IBOutlet var locationIconImageView : UIImageView!
    
    @IBOutlet var distanceLabel : UILabel!
    @IBOutlet var distanceLabelContainer : UIView!
    
    @IBOutlet var eventsTableView : UITableView!
    
    var events : [EventModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.delegate = self
        
        placeImageView.image = UIImage(named: "club")
        
        placeLabel.text = "Club El Camino"
        placeLabel.font = UIFont(name: MegaTheme.fontName, size: 18)
        placeLabel.textColor = UIColor.blackColor()
        
        addressLabel.text = "Paris, France"
        addressLabel.font = UIFont(name: MegaTheme.fontName, size: 13)
        addressLabel.textColor = UIColor(white: 0.43, alpha: 1.0)
        
        locationIconImageView.image = UIImage(named: "location")?.imageWithRenderingMode(.AlwaysTemplate)
        locationIconImageView.tintColor = UIColor(white: 0.43, alpha: 1.0)
        locationIconImageView.contentMode = .ScaleAspectFill
        
        distanceLabel.text = "1.4Km"
        distanceLabel.font = UIFont(name: MegaTheme.semiBoldFontName, size: 14)
        distanceLabel.textColor = UIColor.whiteColor()
        distanceLabelContainer.backgroundColor = UIColor(red: 0.34, green: 0.80, blue: 0.80, alpha: 1.0)
        distanceLabelContainer.layer.cornerRadius = 4
        
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        eventsTableView.estimatedRowHeight = 100.0;
        eventsTableView.rowHeight = UITableViewAutomaticDimension;
        eventsTableView.separatorStyle = UITableViewCellSeparatorStyle.None

        
        let event1 = EventModel(title: "Kasabian, The Group", type: "concert", time: "22.30")
        event1.description = "Kasabian draw an eclectic crowd, from men with their parents in fleeces to young lads sweating in retro sportswear. The glue that brings them together is a fierce adoration of a four-piece rock band from Leicester. The allure for them is so sticky that 25,000 of them will pour into Brixton Academy over five nights."
        
        let event2 = EventModel(title: "Summer Poolside Party", type: "club", time: "21:00")
        event2.description = "Pop has always had its ageing production wizards, and 47-year-old French DJ David Guetta is one of the key figures in modern chart music. His seventh album offers a dynamic snapshot of the mainstream 21st-century sound: bright, squashed and thumping club beats."
        
        let event3 = EventModel(title: "Lenny Kravitz Live", type: "concert", time: "22.45")
        event3.description = "ravitz turned 50 in May, but you would hardly know it. His fruitful career has seen him revel in the rich influences of Sixties and Seventies soul, funk and rock. Though he's still writing music, he has carved out an acting career more recently, starring in critically acclaimed films such as Precious, The Hunger Games and The Butler."
        
        events = [event1, event2, event3]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    
        let coordinate = CLLocationCoordinate2DMake(51.50722, -0.1275)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        
        let region : MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = ADVMapAnnotation(title: "El Camino", subtitle: "Live music, Concert shows and more", coordinate: coordinate)
        
        mapView.addAnnotation(annotation)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell") as! EventCell
        
        let event = events[indexPath.row]
        
        cell.titleLabel.text = event.title
        cell.timeLabel.text = event.time
        cell.descriptionLabel.text = event.description
        cell.typeImageView.image = event.type == "club" ? UIImage(named: "event-club") : UIImage(named: "event-concert")
        
        return cell
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if(annotation.isKindOfClass(ADVMapAnnotation)) {
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier("Annotation")
            
            if annotationView == nil {
                
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "Annotation")
                
                if let v = annotationView{
                    v.enabled = true
                    v.enabled = true
                    v.canShowCallout = true
                    v.image = UIImage(named: "map-annotation")

                }
            }
            
            annotationView!.annotation = annotation
            return annotationView
        }
        
        return nil
    }
}

class EventModel {
    
    var title : String
    var type : String
    var time : String
    var description : String?
    
    init(title: String, type: String, time: String){
        
        self.title = title
        self.type = type
        self.time = time
    }
}

class ADVMapAnnotation : NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}
