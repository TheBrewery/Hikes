//
//  WHSitesViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/2/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class WHSiteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    private let gradientLayer = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()

        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.colors = [UIColor(white: 0, alpha: 0).CGColor, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.6).CGColor]

        contentView.layer.insertSublayer(gradientLayer, below: titleLabel.layer)
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
}

class WHSitesViewController: TBBaseViewController {
    let WHSiteCollectionViewCellIdentifier = "WHSiteCollectionViewCellIdentifier"

    let dataSource = SitesRealmDataSource()

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewTopConstraint: NSLayoutConstraint!

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        preferredBlurredStatusBarStyleBarStyle = .LightDefault

        NSNotificationCenter.defaultCenter().addObserver(self.collectionView, selector: "reloadData", name: RealmDataBaseDidLoadNotification, object: nil)
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

        //        TODO
        let attributedString = NSMutableAttributedString(string: site.name, attributes: [NSFontAttributeName: UIFont.regularFontOfSize(24)])
        attributedString.appendAttributedString(NSAttributedString(string: " " + site.countries, attributes: [NSFontAttributeName: UIFont.lightFontOfSize(24)]))
        cell.titleLabel.attributedText = attributedString
        cell.titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.titleLabel.layer.shadowOpacity = 0.32

        cell.rightLabel.attributedText = Ionic.Heart.attributedStringWithFontSize(28)
        cell.rightLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.rightLabel.layer.shadowOpacity = 0.32

        if let url = site.imageUrl {
            cell.imageView?.af_setImageWithURL(url, placeholderImage: UIImage(named:"petra")!)
        }

        return cell
    }
}
