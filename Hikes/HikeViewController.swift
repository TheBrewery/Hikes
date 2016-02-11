//
//  HikeViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class HikeViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var gainLabel: UILabel!
    @IBOutlet weak var lossLabel: UILabel!
    
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
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}