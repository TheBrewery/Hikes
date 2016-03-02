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

class WHSiteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!

    private func updateSaveButton() {
        let attributedString = site.saved ? Ionic.IosHeart.attributedStringWithFontSize(28) : Ionic.IosHeartOutline.attributedStringWithFontSize(28)
        let textColor = site.saved ? UIColor.whRedColor() : UIColor.whiteColor()
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: textColor, range: NSMakeRange(0, attributedString.length))
        saveButton.setAttributedTitle(mutableAttributedString, forState: .Normal)
    }

    private let gradientLayer = CAGradientLayer()

    var site: Site! {
        didSet {
            titleLabel.text = site.name
            titleLabel.font = UIFont.regularFontOfSize(20)
            titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
            titleLabel.layer.shadowOpacity = 0.32

            subtitleLabel.text = site.countries
            subtitleLabel.font = UIFont.lightFontOfSize(18)

            saveButton.layer.shadowOffset = CGSize(width: 0, height: 1)
            saveButton.layer.shadowOpacity = 0.32
            saveButton.backgroundColor = UIColor.clearColor()
            updateSaveButton()

            if let url = site.imageUrl {
                imageView?.af_setImageWithURL(url, placeholderImage: UIImage(named:"petra")!)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.colors = [UIColor(white: 0, alpha: 0).CGColor, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.6).CGColor]

        contentView.layer.insertSublayer(gradientLayer, below: titleLabel.layer)

        contentView.addSubview(saveButton)
        saveButton.addTarget(self, action: "updateSaved", forControlEvents: .TouchUpInside)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height/2.0)
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

    @IBOutlet var collectionView: UICollectionView!

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredBlurredStatusBarStyleBarStyle = .LightDefault

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
        return CGSizeMake(collectionView.frame.width, 200)
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
