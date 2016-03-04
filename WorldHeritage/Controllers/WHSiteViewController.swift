//
//  HikeViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class TBHeaderView: UIView {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var topContentInset: CGFloat!

    var contentOffset = CGPointZero {
        didSet {
            print(contentOffset)
            if contentOffset.y >= 0 {

            } else if contentOffset.y > -topContentInset {

            } else {
                let scaleFactor = 1 + -(topContentInset + contentOffset.y) / imageView.frame.height
                imageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
            }
        }
    }

    var site: Site? {
        didSet {
            guard let site = site else {
                return
            }

            titleLabel.text = site.name

            if let url = site.images.first?.urlForImageSize(.Medium) {
                imageView.af_setImageWithURL(url, placeholderImage: UIImage(named:"the-narrows")!)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



class WHSiteViewController: TBBaseViewController, UIScrollViewDelegate {
    @IBOutlet weak var headerView: TBHeaderView!
    var viewHasLaidOutContraints = false

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var descriptionLabelHeightConstraint: NSLayoutConstraint!

    private var site: Site!

    class func createWith(site: Site) -> WHSiteViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WHSiteViewController") as! WHSiteViewController
        viewController.site = site
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        preferredBlurredStatusBarStyleBarStyle = .NoneLightContent

        if let url = site.imageUrl {
            imageView.af_setImageWithURL(url)
        }

        mapView.centerCoordinate = site.coordinate
        mapView.addAnnotation(WHSiteAnnotation(site: site))
        mapView.userInteractionEnabled = false
        mapViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        mapViewContainer.layer.shadowOpacity = 0.32

        backButton.setAttributedTitle(Ionic.ChevronLeft.attributedStringWithFontSize(30), forState: UIControlState.Normal)
        backButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        backButton.layer.shadowOpacity = 0.32

        shareButton.setAttributedTitle(Ionic.Share.attributedStringWithFontSize(30), forState: UIControlState.Normal)
        shareButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        shareButton.layer.shadowOpacity = 0.32

        scrollView.contentInset.top = 136

        let style = NSMutableParagraphStyle()
        style.paragraphSpacing = 16.0

        let trimmedDescription = site.fullDescription.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let attributes = [NSFontAttributeName : UIFont.lightFontOfSize(16.0), NSParagraphStyleAttributeName: style]
        descriptionLabel.attributedText = NSAttributedString(string: trimmedDescription, attributes: attributes)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        descriptionLabel.sizeToFit()
        descriptionLabelHeightConstraint.constant = descriptionLabel.frame.height
        scrollView.contentSize = CGSize(width: view.frame.width, height: descriptionLabel.frame.origin.y + descriptionLabel.frame.height + 12.0)
    }

    @IBAction func dismiss() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
//        headerView.contentOffset = scrollView.contentOffset
        let contentOffset = scrollView.contentOffset
        if contentOffset.y >= 40 {
            visualEffectView.alpha = min(1, (contentOffset.y - 40.0)/40.0)
        } else if contentOffset.y > -136 {
            visualEffectView.alpha = 0
        } else {
            visualEffectView.alpha = min(1, -(136 + contentOffset.y)/40.0)
            let scaleFactor = 1 + -(136 + contentOffset.y) / imageView.frame.height
            imageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
        }
    }
}

extension WHSiteViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        let reuseId = "Pin"
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
