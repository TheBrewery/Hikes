//
//  HikeViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class HikeViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var hike: Hike!
    
    class func createWith(hike: Hike) -> HikeViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HikeViewController") as! HikeViewController
        viewController.title = hike.name
        viewController.hike = hike
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subtitleLabel.text = hike.locality
        rightLabel.text = String(format: "%.1f mi", hike.distance/1.6)
        
        if let url = hike.images.first?.urlForImageSize(.Medium) {
            imageView.af_setImageWithURL(url, placeholderImage: UIImage(named:"the-narrows")!)
        }
        
        
        let locationAttributedString = NSMutableAttributedString(string: "\u{f14e}", attributes: [NSFontAttributeName: UIFont(name: "FontAwesome", size: 20)!])
        locationAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.lat), \(hike.lng)"))
        locationLabel.attributedText = locationAttributedString
        
        let gainAttributedString = NSMutableAttributedString(string: "\u{f01a}", attributes: [NSFontAttributeName: UIFont(name: "FontAwesome", size: 20)!])
        gainAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.elevationGain)"))
        gainLabel.attributedText = gainAttributedString
        
        let maxAttributedString = NSMutableAttributedString(string: "\u{f01a}", attributes: [NSFontAttributeName: UIFont(name: "FontAwesome", size: 20)!])
        maxAttributedString.appendAttributedString(NSAttributedString(string: " \(hike.elevationMax)"))
        maxLabel.attributedText = maxAttributedString
        
        scrollView.contentInset.top = 136
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentSize.height = view.frame.height
    }
    
    @IBAction func dismiss() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        if scrollView.contentOffset.y > -scrollView.contentInset.top {
            
        } else {
            let scaleFactor = 1 + -2.0 * (scrollView.contentInset.top + scrollView.contentOffset.y) / scrollView.frame.height
            imageView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
        }
    }
}