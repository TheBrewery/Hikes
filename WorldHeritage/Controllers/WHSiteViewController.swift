//
//  HikeViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit


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
//    @IBOutlet weak var headerView: TBHeaderView!

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!

    private var site: Site!

    class func createWith(site: Site) -> WHSiteViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WHSiteViewController") as! WHSiteViewController
        viewController.site = site
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredBlurredStatusBarStyleBarStyle = .LightDefault
        
//        subtitleLabel.text = site.locality
//        rightLabel.text = String(format: "%.1f mi", hike.distance/1.6)
//
//        let locationAttributedString = NSMutableAttributedString(string: Iconic.Compass.rawValue, attributes: [NSFontAttributeName: UIFont.iconicFontOfSize(20)])
//        locationAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.lat), \(hike.lng)"))
//        locationLabel.attributedText = locationAttributedString
//
//        let gainAttributedString = NSMutableAttributedString(string: Iconic.ArrowTop.rawValue, attributes: [NSFontAttributeName: UIFont.iconicFontOfSize(20)])
//        gainAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.elevationGain)"))
//        gainLabel.attributedText = gainAttributedString
//
//        let maxAttributedString = NSMutableAttributedString(string: Iconic.ArrowCircleTop.rawValue, attributes: [NSFontAttributeName: UIFont.iconicFontOfSize(20)])
//        maxAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.elevationMax)"))
//        maxLabel.attributedText = maxAttributedString

        scrollView.contentInset.top = 136
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        scrollView.contentSize.height = view.frame.height
    }

    @IBAction func dismiss() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
//        headerView.contentOffset = scrollView.contentOffset
    }
}
