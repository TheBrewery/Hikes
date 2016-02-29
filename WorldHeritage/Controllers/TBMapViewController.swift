//
//  TBMapViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/18/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import RealmSwift

class TBMapViewController: TBBaseViewController {
    var dataSource = SitesRealmDataSource()

    @IBOutlet var mapView: MKMapView!

    lazy var recenterButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)
        
        let button = TBCircularIconButton(icon: Ionic.Pinpoint, frame: buttonFrame, target: self, action: "recenterMap")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])
        
        self.view.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -69)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()
    
    lazy var searchButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)
        
        let button = TBCircularIconButton(icon: Ionic.IosSearch, frame: buttonFrame, target: self, action: "search")
        button.iconColor = UIColor.whiteColor()
        button.color = UIColor.whDarkBlueColor()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])
        
        self.view.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -79 - buttonSize.height)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredBlurredStatusBarStyleBarStyle = .LightDefault
        
        view.addSubview(recenterButton)
        view.addSubview(searchButton)
        
        dataSource.fetch { [weak self] (objects) -> () in
//            TODO fix objects
            guard let _self = self else {
                return
            }
            
            for site in _self.dataSource.fetchedResults {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(site.lat, site.lng)
                annotation.title = site.name
                annotation.subtitle = site.location
                _self.mapView.addAnnotation(annotation)
            }
        }
    }
    
    func search() {
        
    }
    
    func recenterMap() {
        guard let coordinate = mapView.userLocation.location?.coordinate else {
            return
        }
        mapView.setCenterCoordinate(coordinate, animated: true)
    }
}
