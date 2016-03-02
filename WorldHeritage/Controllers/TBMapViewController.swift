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
            guard let _self = self else {
                return
            }

            var annotations = [MKAnnotation]()
            for site in _self.dataSource.fetchedResults {
                annotations.append(WHSiteAnnotation(site: site))
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

class WHSiteAnnotation: NSObject, MKAnnotation {
    var site: Site!

    init(site: Site) {
        self.site = site
    }

    var coordinate: CLLocationCoordinate2D {
        return site.coordinate
    }

    var title: String? {
        return site.name
    }

    var subtitle: String? {
        return site.location.isEmpty ? site.countries : site.location
    }
}

class WHSiteAnnotationView: MKAnnotationView {
    var icon = Ionic.IosLocation {
        didSet {
            self.image = UIImage.imageWithIcon(icon, fontSize: fontSize, color: iconTintColor)
        }
    }

    var fontSize: CGFloat = 40.0 {
        didSet {
            self.image = UIImage.imageWithIcon(icon, fontSize: fontSize, color: iconTintColor)
        }
    }

    var iconTintColor: UIColor {
        guard let annotation = annotation as? WHSiteAnnotation else {
            return UIColor.redColor()
        }

        return annotation.site.category.lowercaseString == "natural" ? UIColor.greenColor() : UIColor.whDarkBlueColor()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage.imageWithIcon(icon, fontSize: fontSize, color: iconTintColor)
        self.rightCalloutAccessoryView = UIView()
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.image = UIImage.imageWithIcon(icon, fontSize: fontSize, color: iconTintColor)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TBMapViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        NSOperationQueue().addOperationWithBlock({
            let mapBoundsWidth = Double(self.mapView.bounds.size.width)
            let mapRectWidth:Double = self.mapView.visibleMapRect.size.width
            let scale:Double = mapBoundsWidth / mapRectWidth

            executeOn(.Main, block: {
                let annotationArray = self.clusteringManager.clusteredAnnotationsWithinMapRect(self.mapView.visibleMapRect, withZoomScale:scale)
                self.clusteringManager.displayAnnotations(annotationArray, onMapView:self.mapView)
            })
        })
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        var reuseId = ""
        if annotation.isKindOfClass(FBAnnotationCluster) {
            reuseId = "Cluster"
            var clusterView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
            if clusterView == nil {
                clusterView = FBAnnotationClusterView(annotation: annotation, reuseIdentifier: reuseId)
            } else {
                clusterView?.annotation = annotation
            }
            return clusterView
        } else {
            reuseId = "Pin"
            var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? WHSiteAnnotationView
            if pinView == nil {
                pinView = WHSiteAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                pinView?.canShowCallout = true
            } else {
                pinView?.annotation = annotation
            }
            return pinView
        }
    }
}
