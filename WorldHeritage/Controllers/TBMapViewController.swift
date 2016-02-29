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
import FBAnnotationClusteringSwift

class TBMapViewController: TBBaseViewController {
    let clusteringManager = FBClusteringManager()

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
            
            var annotations = [MKAnnotation]()
            for site in _self.dataSource.fetchedResults {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(site.lat, site.lng)
                annotation.title = site.name
                annotation.subtitle = site.location
                annotations.append(annotation)
            }
            
            _self.clusteringManager.addAnnotations(annotations)
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

extension TBMapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        NSOperationQueue().addOperationWithBlock({
            let mapBoundsWidth = Double(self.mapView.bounds.size.width)
            let mapRectWidth:Double = self.mapView.visibleMapRect.size.width
            let scale:Double = mapBoundsWidth / mapRectWidth
            let annotationArray = self.clusteringManager.clusteredAnnotationsWithinMapRect(self.mapView.visibleMapRect, withZoomScale:scale)
            self.clusteringManager.displayAnnotations(annotationArray, onMapView:self.mapView)
        })
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var reuseId = ""
        if annotation.isKindOfClass(FBAnnotationCluster) {
            reuseId = "Cluster"
            var clusterView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            clusterView = FBAnnotationClusterView(annotation: annotation, reuseIdentifier: reuseId, options: nil)
            return clusterView
        } else {
            reuseId = "Pin"
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.pinTintColor = UIColor.whDarkBlueColor()
            return pinView
        }
    }
    
}
