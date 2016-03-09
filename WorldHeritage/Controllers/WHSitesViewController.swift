//
//  WHSitesViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/2/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

private let margin: CGFloat = 10.0
private let imageHeight: CGFloat = 160.0

extension CGRect {
    mutating func divide(amount: CGFloat, edge: CGRectEdge) -> CGRect {
        var slice = CGRectZero
        CGRectDivide(self, &slice, &self, amount, edge)
        return slice
    }
}

class TBButton: UIButton {
   override var highlighted: Bool {
        didSet {
            UIView.animateWithDuration(0.1) {
                self.transform = self.highlighted ? CGAffineTransformMakeScale(0.8, 0.8) : CGAffineTransformIdentity
                self.alpha = self.highlighted ? 0.5 : 1.0
            }
        }
    }
}

class WHSiteCollectionViewCell: UICollectionViewCell {
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var imageViewContainer: UIView!
    var imageView: UIImageView!
    var saveButton: TBButton!

    private func updateSaveButton() {
        let attributedString = site.saved ? Ionic.IosHeart.attributedStringWithFontSize(32) : Ionic.IosHeartOutline.attributedStringWithFontSize(32)
        let textColor = site.saved ? UIColor.whRedColor() : UIColor.whiteColor()

        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: NSMakeRange(0, attributedString.length))
        saveButton.setAttributedTitle(mutableAttributedString, forState: .Normal)
    }

    private let gradientLayer = CAGradientLayer()

    private class func titleAttributedString(site: Site) -> NSAttributedString {
        let color = UIColor.whDarkBlueColor()
        let attributedString = NSMutableAttributedString(string: site.name, attributes: [NSFontAttributeName: UIFont.regularFontOfSize(20), NSForegroundColorAttributeName: color])
        attributedString.appendAttributedString(NSAttributedString(string: " \(site.countries)", attributes: [NSFontAttributeName: UIFont.lightFontOfSize(20), NSForegroundColorAttributeName: color]))
        return attributedString
    }

    private class func subtitleAttributedString(site: Site) -> NSAttributedString {
        return NSAttributedString(string: site.location, attributes: [NSFontAttributeName: UIFont.lightFontOfSize(20), NSForegroundColorAttributeName: UIColor.darkTextColor()])
    }

    var site: Site! {
        didSet {
            titleLabel.attributedText = WHSiteCollectionViewCell.titleAttributedString(site)
            subtitleLabel.attributedText = WHSiteCollectionViewCell.subtitleAttributedString(site)

            titleLabel.frame.size.height = titleLabel.sizeThatFits(CGSize(width: titleLabel.frame.width, height: 9999)).height
            imageViewContainer.frame.origin.y = titleLabel.frame.maxY + margin
            subtitleLabel.frame.origin.y = imageViewContainer.frame.maxY + margin
            subtitleLabel.frame.size.height = subtitleLabel.sizeThatFits(CGSize(width: subtitleLabel.frame.width, height: 9999)).height

            updateSaveButton()

            if let url = site.imageUrl {
                let image = UIImage.imageWithIcon(Ionic.Image, fontSize: 100.0, color: UIColor.lightGrayColor())
                let trans = UIImageView.ImageTransition.CrossDissolve(0.2)

                imageView.contentMode = .Center

                imageView.af_setImageWithURL(url, placeholderImage: image, filter: nil, imageTransition: trans) { [weak self] (response) -> Void in
                    guard let _self = self where response.result.isSuccess else {
                        return
                    }

                    _self.imageView.contentMode = .ScaleAspectFill
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let insetRect = CGRectInset(bounds, margin, margin)

        titleLabel = UILabel(frame: insetRect)
        titleLabel.numberOfLines = 0
        titleLabel.minimumScaleFactor = 0.75
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        titleLabel.layer.shadowOpacity = 0.16

        subtitleLabel = UILabel(frame: insetRect)
        subtitleLabel.numberOfLines = 0

        let imageViewContainerFrame = CGRect(x: margin, y: 0, width: insetRect.width, height: imageHeight)
        let buttonHeight: CGFloat = 50.0

        imageView = UIImageView(frame: CGRect(x: 0, y: -30, width: insetRect.width, height: imageHeight + 60))
        saveButton = TBButton(frame: CGRect(x: imageViewContainerFrame.width - buttonHeight, y: imageViewContainerFrame.height - buttonHeight, width: buttonHeight, height: buttonHeight))
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        saveButton.layer.shadowOpacity = 0.16
        saveButton.backgroundColor = UIColor.clearColor()
        saveButton.addTarget(self, action: "updateSaved", forControlEvents: .TouchUpInside)

        imageViewContainer = UIView(frame: imageViewContainerFrame)
        imageViewContainer.clipsToBounds = true

        imageViewContainer.addSubview(imageView)
        imageViewContainer.addSubview(saveButton)

        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(imageViewContainer)

        backgroundColor = UIColor.whiteColor()
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.16
        layer.masksToBounds = false

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private class func titleHeight(width: CGFloat, site: Site) -> CGFloat {
        let boundingSize = CGSize(width: width - 2 * margin, height: 9999)
        return self.titleAttributedString(site).boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, context: nil).height
    }

    private class func subtitleHeight(width: CGFloat, site: Site) -> CGFloat {
        let boundingSize = CGSize(width: width - 2 * margin, height: 9999)
        return self.subtitleAttributedString(site).boundingRectWithSize(boundingSize, options: .UsesLineFragmentOrigin, context: nil).height
    }

    class func sizeThatFits(width: CGFloat, site: Site) -> CGSize {
        return CGSize(width: width, height: margin * 4 + titleHeight(width, site: site) + imageHeight + subtitleHeight(width, site: site))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
        guard let parallaxAttributes = layoutAttributes as? TBParallaxLayoutAttributes else {
            return
        }
        self.imageView.frame.origin.y = parallaxAttributes.parallaxOffset.y
    }

    // MARK: - Private

    @IBAction func updateSaved() {
        do {
            try Realm().write {
                site.saved = !site.saved
            }
        } catch {

        }
        self.updateSaveButton()
    }
}

class WHSitesViewController: TBBaseViewController {
    let WHSiteCollectionViewCellIdentifier = "WHSiteCollectionViewCellIdentifier"

    var dataSource = SitesRealmDataSource()
    var cellSizeCache = [String: CGSize]()

    @IBOutlet var collectionView: UICollectionView!

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredBlurredStatusBarStyleBarStyle = .LightDefault

        collectionView.registerClass(WHSiteCollectionViewCell.self, forCellWithReuseIdentifier: WHSiteCollectionViewCellIdentifier)

        let layout = collectionView.collectionViewLayout as! TBParallaxFlowLayout
        layout.minimumLineSpacing = 20.0

        NSNotificationCenter.defaultCenter().addObserver(self.collectionView, selector: "reloadData", name: RealmDataBaseDidLoadNotification, object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        dataSource.fetch { [weak self] (objects) -> () in
            guard let _self = self else {
                return
            }
            _self.collectionView.reloadData()
        }
    }
}

extension WHSitesViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewController = WHSiteViewController.createWith(dataSource[indexPath]!)
        self.showViewController(viewController, sender: nil)
    }
}

extension WHSitesViewController: UICollectionViewDataSource {
    // Mark - UICollectionViewDataSource

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let site = dataSource[indexPath]!
        guard let size = cellSizeCache[site.identifier] else {
            let newSize = WHSiteCollectionViewCell.sizeThatFits(collectionView.frame.width - 24.0, site: site)
            cellSizeCache[site.identifier] = newSize
            return newSize
        }

        return size
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(WHSiteCollectionViewCellIdentifier, forIndexPath: indexPath) as! WHSiteCollectionViewCell

        guard let site = dataSource[indexPath] else {
            return cell
        }

        cell.site = site
        return cell
    }
}
