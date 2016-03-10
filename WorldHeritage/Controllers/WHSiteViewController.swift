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

class TBDropDownMenu: UIView {
    lazy var mainMenuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.bounds.width - 50 - self.margin, y: 30, width: 50, height: 50))
        button.addTarget(self, action: "didTapMainMenuButton", forControlEvents: .TouchUpInside)
        button.setAttributedTitle(Ionic.IosPlusEmpty.attributedStringWithFontSize(30.0), forState: .Normal)
        button.backgroundColor = UIColor.whiteColor()
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.16
        button.layer.cornerRadius = 25.0
        return button
    }()

    var margin: CGFloat = 10.0

    var isShowing = false {
        didSet {
            let cornerRadiusAnimation = CABasicAnimation(keyPath: "cornerRadius")
            cornerRadiusAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            cornerRadiusAnimation.fromValue = visualEffectView.layer.cornerRadius
            cornerRadiusAnimation.toValue = isShowing ? 6.0 : 25.0
            cornerRadiusAnimation.duration = 0.15

            visualEffectView.layer.addAnimation(cornerRadiusAnimation, forKey: "cornerRadius")
            visualEffectView.layer.cornerRadius = cornerRadiusAnimation.toValue as! CGFloat

            if isShowing {
                for button in self.menuButtons {
                    button.center = self.mainMenuButton.center
                    button.hidden = false
                }

                UIView.animateWithDuration(0.15, animations: { () -> Void in
                    self.mainMenuButton.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
                    self.visualEffectView.frame = CGRect(x: self.bounds.width - 60 - self.margin, y: 30, width: 60, height: 60)
                    }, completion: { (fin) -> Void in

                })

                UIView.animateWithDuration(0.2, delay: 0.15, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.85, options: .CurveEaseInOut, animations: { () -> Void in
                    for (index, button) in self.menuButtons.enumerate() {
                        if index == 0 {
                            button.center.y = self.mainMenuButton.frame.maxY + button.frame.height/2.0 + self.margin
                        } else {
                            button.center.y = self.menuButtons[index - 1].frame.maxY + button.frame.height/2.0 + self.margin
                        }
                    }
                    }, completion: { (finished) -> Void in

                })

            } else {
                UIView.animateWithDuration(0.15, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: { () -> Void in
                    for button in self.menuButtons {
                        button.center = self.mainMenuButton.center
                    }
                    }, completion: { (finished) -> Void in

                })

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.mainMenuButton.layer.transform = CATransform3DIdentity
                    self.visualEffectView.frame = CGRect(x: self.bounds.width - 50 - self.margin, y: 30, width: 50, height: 50)
                    }, completion: { (finished) -> Void in
                        for button in self.menuButtons {
                            button.hidden = true
                        }
                })
            }
        }
    }

    lazy private var visualEffectView: UIVisualEffectView = {
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
        visualEffectView.frame = CGRect(x: self.bounds.width - 50 - self.margin, y: 30, width: 50, height: 50)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTapVisualEffectsViewButton")
        visualEffectView.addGestureRecognizer(tapGestureRecognizer)
        visualEffectView.layer.masksToBounds = true
        visualEffectView.layer.cornerRadius = 25.0
        return visualEffectView
    }()
    private var menuButtons = [UIButton]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        return isShowing || mainMenuButton.frame.contains(point)
    }

    init(view: UIView, buttons: [UIButton]? = nil) {
        super.init(frame: view.bounds)
        addSubview(visualEffectView)
        addSubview(mainMenuButton)
        view.addSubview(self)

        guard let buttons = buttons else {
            return
        }

        for button in buttons {
            addMenuButton(button)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public

    func menuButtonAtIndex(index: NSInteger) -> UIButton? {
        return menuButtons[index]
    }

    func addMenuButton(button: UIButton) {
        button.hidden = true
        insertSubview(button, belowSubview: mainMenuButton)
        menuButtons.append(button)
    }

    // MARK: - Private

    @objc private func didTapMainMenuButton() {
        isShowing = !isShowing
    }

    @objc private func didTapVisualEffectsViewButton() {
        isShowing = false
    }
}

class WHSiteViewController: TBBaseViewController, UIScrollViewDelegate {
    var viewHasLaidOutContraints = false

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!

    @IBOutlet weak var moreButton: UIButton!

    var saveButton: UIButton!

    lazy var dropDownMenu: TBDropDownMenu = {
       let dropDownMenu = TBDropDownMenu(view: self.view)
        return dropDownMenu
    }()

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapViewContainer: UIView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var navigationTitleLabelTopContraint: NSLayoutConstraint!

    private var site: Site!

    class func createWith(site: Site) -> WHSiteViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WHSiteViewController") as! WHSiteViewController
        viewController.site = site
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let shareButton = UIButton(frame: CGRect(x: 0, y: 30, width: 50, height: 50))
//        shareButton.addTarget(self, action: "didTapMainMenuButton", forControlEvents: .TouchUpInside)
        shareButton.setAttributedTitle(Ionic.IosUploadOutline.attributedStringWithFontSize(30.0), forState: .Normal)
        shareButton.backgroundColor = UIColor.whiteColor()
        shareButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        shareButton.layer.shadowOpacity = 0.16
        shareButton.layer.cornerRadius = 25.0

        saveButton = UIButton(frame: CGRect(x: 0, y: 30, width: 50, height: 50))
        saveButton.addTarget(self, action: "didTapSaveButton", forControlEvents: .TouchUpInside)
        saveButton.backgroundColor = UIColor.whiteColor()
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        saveButton.layer.shadowOpacity = 0.16
        saveButton.layer.cornerRadius = 25.0

        updateSaveButton()

        dropDownMenu.addMenuButton(shareButton)
        dropDownMenu.addMenuButton(saveButton)

        preferredBlurredStatusBarStyleBarStyle = .NoneLightContent

        if let url = site.imageUrl {
            imageView.af_setImageWithURL(url)
        }

        titleLabel.text = site.name
        titleLabel.font = UIFont.regularFontOfSize(18.0)
        titleLabel.textColor = UIColor.whDarkBlueColor()

        navigationTitleLabel.text = site.name
        navigationTitleLabel.alpha = 0
        navigationTitleLabel.transform = CGAffineTransformMakeScale(0.8, 0.8)
        navigationTitleLabelTopContraint.constant = 44

        navigationTitleLabel.font = UIFont.semiboldFontOfSize(18.0)
        navigationTitleLabel.minimumScaleFactor = 0.8
        navigationTitleLabel.adjustsFontSizeToFitWidth = true
        navigationTitleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        navigationTitleLabel.layer.shadowOpacity = 0.16

        mapView.centerCoordinate = site.coordinate
        mapView.addAnnotation(WHSiteAnnotation(site: site))
        mapView.userInteractionEnabled = false
        mapViewContainer.layer.shadowOffset = CGSize(width: 0, height: 1)
        mapViewContainer.layer.shadowOpacity = 0.16

        backButton.setAttributedTitle(Ionic.IosArrowLeft.attributedStringWithFontSize(30), forState: UIControlState.Normal)
        backButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        backButton.layer.shadowOpacity = 0.16

        scrollView.contentInset.top = 136
        scrollView.scrollIndicatorInsets.top = 136

        let style = NSMutableParagraphStyle()
        style.paragraphSpacing = 16.0

        let trimmedDescription = site.fullDescription.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let attributes = [NSFontAttributeName : UIFont.lightFontOfSize(16.0), NSParagraphStyleAttributeName: style]
        descriptionLabel.attributedText = NSAttributedString(string: trimmedDescription, attributes: attributes)

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        descriptionLabel.sizeHeightToFit()
        titleLabel.sizeHeightToFit()
        scrollView.contentSize = CGSize(width: view.frame.width, height: descriptionLabel.frame.origin.y + descriptionLabel.frame.height + 12.0)
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

    // MARK: - Private

    private func updateSaveButton() {
        let attributedString = site.saved ? Ionic.IosHeart.attributedStringWithFontSize(32) : Ionic.IosHeartOutline.attributedStringWithFontSize(32)
        let textColor = site.saved ? UIColor.whRedColor() : UIColor.blackColor()

        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: NSMakeRange(0, attributedString.length))
        saveButton.setAttributedTitle(mutableAttributedString, forState: .Normal)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
//        headerView.contentOffset = scrollView.contentOffset
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
