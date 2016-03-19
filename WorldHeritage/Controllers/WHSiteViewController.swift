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
import RealmSwift

class WHSiteViewController: TBBaseViewController, UIScrollViewDelegate {
    var viewHasLaidOutContraints = false

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!

    @IBOutlet var mapViewToViewConstraints: [NSLayoutConstraint]!
    @IBOutlet var mapViewToContainerConstraints: [NSLayoutConstraint]!

    var saveButton: UIButton!

    lazy var dropDownMenu: TBDropDownMenu = {
       let dropDownMenu = TBDropDownMenu(view: self.view)
        return dropDownMenu
    }()

    lazy var recenterButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)

        let button = TBCircularIconButton(icon: Ionic.Pinpoint, frame: buttonFrame, target: self, action: "recenterMapToCurrentLocation")

        let tapGesture = UITapGestureRecognizer(target: self, action: "zoomToCurrentLocation")
        tapGesture.numberOfTapsRequired = 2
        button.addGestureRecognizer(tapGesture)

        button.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])

        self.mapView.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.mapView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.mapView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -20)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()

    lazy var closeMapButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)

        let button = TBCircularIconButton(icon: Ionic.Close, frame: buttonFrame, target: self, action: "didTapMapViewContainer")
        button.iconColor = UIColor.whiteColor()
        button.color = UIColor.whDarkBlueColor()

        button.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])

        self.mapView.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.mapView, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.mapView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 30)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var inscriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!

    @IBOutlet weak var navigationTitleLabelTopContraint: NSLayoutConstraint!
    @IBOutlet weak var categoryLabelWidthContraint: NSLayoutConstraint!

    private var site: Site!

    class func createWith(site: Site) -> WHSiteViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WHSiteViewController") as! WHSiteViewController
        viewController.site = site
        return viewController
    }

    var mapViewIsExpanded = false {
        didSet {
            preferredBlurredStatusBarStyleBarStyle = mapViewIsExpanded ? .LightDefault :.NoneLightContent
            mapView.userInteractionEnabled = mapViewIsExpanded

            view.removeConstraints(mapViewIsExpanded ? mapViewToContainerConstraints : mapViewToViewConstraints)
            view.addConstraints(mapViewIsExpanded ? mapViewToViewConstraints : mapViewToContainerConstraints)

            view.insertSubview(mapView, aboveSubview: mapViewIsExpanded ? backButton : scrollView)

            UIView.animateWithDuration(0.2) {
                self.recenterButton.alpha = CGFloat(self.mapViewIsExpanded)
                self.closeMapButton.alpha = CGFloat(self.mapViewIsExpanded)
                self.backButton.alpha = CGFloat(!self.mapViewIsExpanded)
                self.dropDownMenu.alpha = CGFloat(!self.mapViewIsExpanded)
                self.view.layoutIfNeeded()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        recenterButton.alpha = 0
        closeMapButton.alpha = 0

        setupMenuButtons()

        let year = site.inscriptionYear.substringFromIndex(site.inscriptionYear.startIndex.advancedBy(2))
        categoryLabel.text = "\(site.category) '\(year)"
        categoryLabel.font = UIFont.regularFontOfSize(14.0)
        categoryLabel.layer.cornerRadius = 3.0
        categoryLabel.layer.masksToBounds = true
        categoryLabel.textColor = UIColor.whiteColor()
        categoryLabel.textAlignment = .Center
        categoryLabel.backgroundColor = site.category.containsString("Natural") ? UIColor.whDarkGreenColor() : UIColor.whDarkBlueColor()

        categoryLabelWidthContraint.constant = categoryLabel.sizeThatFits(CGSizeZero).width + 10

        inscriptionLabel.alpha = 0
        inscriptionLabel.font = UIFont.regularFontOfSize(16.0)
        inscriptionLabel.textColor = UIColor.grayColor()

        preferredBlurredStatusBarStyleBarStyle = .NoneLightContent

        if let url = site.imageUrl {
            imageView.af_setImageWithURL(url)
        }

        titleLabel.attributedText = site.titleAttributedString
        subtitleLabel.attributedText = WHSiteViewController.subtitleAttributedString(site)

        navigationTitleLabelTopContraint.constant = 44

        navigationTitleLabel.text = site.name
        navigationTitleLabel.alpha = 0
        navigationTitleLabel.transform = CGAffineTransformMakeScale(0.8, 0.8)
        navigationTitleLabel.font = UIFont.semiboldFontOfSize(20.0)
        navigationTitleLabel.minimumScaleFactor = 0.8
        navigationTitleLabel.adjustsFontSizeToFitWidth = true
        navigationTitleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        navigationTitleLabel.layer.shadowOpacity = 0.16

        mapView.addAnnotation(WHSiteAnnotation(site: site))
        mapView.userInteractionEnabled = false
        mapView.showsUserLocation = true
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(site.coordinate, 50000, 50000), animated: true)

        let tapGestureReconginzer = UITapGestureRecognizer(target: self, action: "didTapMapViewContainer")
        mapViewContainer.addGestureRecognizer(tapGestureReconginzer)
        mapViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        mapViewContainer.layer.shadowOpacity = 0.16

        backButton.setAttributedTitle(Ionic.IosArrowLeft.attributedStringWithFontSize(30), forState: UIControlState.Normal)
        backButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        backButton.layer.shadowOpacity = 0.16

        scrollView.contentInset.top = 136
        scrollView.scrollIndicatorInsets.top = 136

        let style = NSMutableParagraphStyle()
        style.paragraphSpacing = 16.0
        style.lineBreakMode = .ByWordWrapping

        let descriptionText = site.fullDescription.isEmpty ? site.shortDescription : site.fullDescription
        let trimmedDescription = descriptionText.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let attributes = [NSFontAttributeName : UIFont.lightFontOfSize(16.0), NSParagraphStyleAttributeName: style]
        let descriptionAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: trimmedDescription, attributes: attributes))

        descriptionAttributedString.appendAttributedString(NSAttributedString(string: "\nSelection Criteria:\n", attributes: [NSFontAttributeName : UIFont.regularFontOfSize(16.0)]))

        for criteria in site.criteria! {
            let criteriaAttributedString = NSMutableAttributedString(attributedString: NSAttributedString(string: "(\(criteria.identifier))", attributes: [NSFontAttributeName: UIFont.regularFontOfSize(16.0), NSParagraphStyleAttributeName: style]))
            let isLast = criteria.identifier == site.criteria?.last?.identifier
            criteriaAttributedString.appendAttributedString(NSAttributedString(string: isLast ? " \(criteria.descriptionText)" : " \(criteria.descriptionText)\n", attributes: attributes))
            descriptionAttributedString.appendAttributedString(criteriaAttributedString)
        }
        descriptionLabel.attributedText = descriptionAttributedString
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        inscriptionLabel.sizeHeightToFit()
        descriptionLabel.sizeHeightToFit()
        titleLabel.sizeHeightToFit()
        subtitleLabel.sizeHeightToFit()
        scrollView.contentSize = CGSize(width: view.frame.width, height: descriptionLabel.frame.origin.y + descriptionLabel.frame.height + 12.0)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset
        if contentOffset.y >= 26 {
            let alpha = min(1, (contentOffset.y - 26.0)/26.0)
            visualEffectView.alpha = alpha
            navigationTitleLabel.alpha = alpha
            let transform = 0.8 + alpha/5.0
            navigationTitleLabel.transform = CGAffineTransformMakeScale(transform, transform)
            navigationTitleLabelTopContraint.constant = max(56-contentOffset.y, 0)
        } else if contentOffset.y > -136 {
            visualEffectView.alpha = 0
            navigationTitleLabel.alpha = 0
        } else {
            visualEffectView.alpha = min(1, -(136 + contentOffset.y)/40.0)
            let scaleFactor = 1 + -(136 + contentOffset.y) / imageView.frame.height
            imageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
        }
    }

    // MARK: - Actions

    @IBAction private func didTapDismissButton() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @objc private func didTapSaveButton() {
        do {
            try Realm().write {
                site.saved = !site.saved
            }
        } catch {

        }
        updateSaveButton()
    }

    @objc private func didTapShareButton() {
//        TODO
        let activityItems = ["Check out WHS!"]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint,
            UIActivityTypeCopyToPasteboard,
            UIActivityTypeAssignToContact,
            UIActivityTypeSaveToCameraRoll,
            UIActivityTypeAddToReadingList,
            UIActivityTypePostToFlickr,
            UIActivityTypePostToVimeo,
            UIActivityTypePostToTencentWeibo,
            UIActivityTypeAirDrop]

        self.presentViewController(activityViewController, animated: true, completion: nil)
    }

    @objc private func didTapLinkButton() {
        UIApplication.sharedApplication().openURL(site.url!)
    }

    @objc private func zoomToCurrentLocation() {
        guard let coordinate = mapView.userLocation.location?.coordinate else {
            return
        }
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 3000, 3000)
        mapView.setRegion(region, animated: true)
    }

    @objc private func recenterMapToCurrentLocation() {
        guard let coordinate = mapView.userLocation.location?.coordinate else {
            return
        }
        mapView.setCenterCoordinate(coordinate, animated: true)
    }

    // MARK: - Private

    private func setupMenuButtons() {
        let shareButton = UIButton(frame: CGRect(x: 0, y: 30, width: 50, height: 50))
        shareButton.addTarget(self, action: "didTapShareButton", forControlEvents: .TouchUpInside)
        shareButton.setAttributedTitle(Ionic.IosUploadOutline.attributedStringWithFontSize(30.0), forState: .Normal)
        shareButton.backgroundColor = UIColor.whiteColor()
        shareButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        shareButton.layer.shadowOpacity = 0.16
        shareButton.layer.cornerRadius = 25.0

        let linkButton = UIButton(frame: CGRect(x: 0, y: 30, width: 50, height: 50))
        linkButton.addTarget(self, action: "didTapLinkButton", forControlEvents: .TouchUpInside)
        linkButton.setAttributedTitle(Ionic.Link.attributedStringWithFontSize(30.0), forState: .Normal)
        linkButton.backgroundColor = UIColor.whiteColor()
        linkButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        linkButton.layer.shadowOpacity = 0.16
        linkButton.layer.cornerRadius = 25.0

        saveButton = UIButton(frame: CGRect(x: 0, y: 30, width: 50, height: 50))
        saveButton.addTarget(self, action: "didTapSaveButton", forControlEvents: .TouchUpInside)
        saveButton.backgroundColor = UIColor.whiteColor()
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        saveButton.layer.shadowOpacity = 0.16
        saveButton.layer.cornerRadius = 25.0

        updateSaveButton()

        dropDownMenu.addMenuButton(shareButton)
        dropDownMenu.addMenuButton(linkButton)
        dropDownMenu.addMenuButton(saveButton)
    }

    private func updateSaveButton() {
        let attributedString = site.saved ? Ionic.IosHeart.attributedStringWithFontSize(32) : Ionic.IosHeartOutline.attributedStringWithFontSize(32)
        let textColor = site.saved ? UIColor.whRedColor() : UIColor.blackColor()

        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: NSMakeRange(0, attributedString.length))
        saveButton.setAttributedTitle(mutableAttributedString, forState: .Normal)
    }

    private class func subtitleAttributedString(site: Site) -> NSAttributedString {
        return NSAttributedString(string: site.location, attributes: [NSFontAttributeName: UIFont.regularFontOfSize(16.0), NSForegroundColorAttributeName: UIColor.darkTextColor()])
    }

    @objc private func didTapMapViewContainer() {
        mapViewIsExpanded = !mapViewIsExpanded
    }
}

extension WHSiteViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let siteLocation = CLLocation(latitude: site.lat, longitude: site.lng)
        let location = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)

        let distance = siteLocation.distanceFromLocation(location)

        self.inscriptionLabel.text = String(format: "%.01f mi", arguments: [distance/1600.0])
        self.inscriptionLabel.sizeHeightToFit()

        UIView.animateWithDuration(0.2) {
            self.inscriptionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }

        guard distance < 8000000.0 else {
            return mapView.setRegion(MKCoordinateRegionMakeWithDistance(site.coordinate, 50000, 50000), animated: true)
        }

        mapView.showAnnotations(mapView.annotations, animated: true)
    }

    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }

        let reuseId = "Pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        } else {
            pinView?.annotation = annotation
        }

        pinView?.pinTintColor = site.category == "Natural" ? UIColor.whDarkGreenColor() : UIColor.whDarkBlueColor()
        return pinView
    }
}
