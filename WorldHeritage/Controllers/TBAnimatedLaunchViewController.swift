//
//  TBAnimatedLaunchViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/18/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class TBAnimatedImageView: UIImageView {
    private var _isAnimating = false

    override var animationImages: [UIImage]? { // The array must contain UIImages. Setting hides the single image. default is nil
        didSet {
            image = animationImages?.first
        }
    }

    override func startAnimating() {
        guard let images = animationImages, let currentImage = image else {
            return
        }

        let nextImage: UIImage
        if let nextIndex = images.indexOf(currentImage) where images.indices.contains(nextIndex + 1) {
            nextImage = images[nextIndex + 1]
        } else {
            nextImage = images.first!
        }

        self._isAnimating = true

        UIView.transitionWithView(self, duration: 1.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.image = nextImage
            }) { (fin) -> Void in
                let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC)))
                dispatch_after(delayTime, dispatch_get_main_queue()) {
                    if self._isAnimating {
                        self.startAnimating()
                    }
                }
        }
    }

    override func stopAnimating() {
        _isAnimating = false
    }
}

class TBAnimatedLaunchViewController: TBBaseViewController {
    var images = [UIImage(named: "colosseum")!, UIImage(named: "giza")!, UIImage(named: "petra")!, UIImage(named: "great_wall")!, UIImage(named: "machu_picchu")!, UIImage(named: "taj_mahal")!]

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var animatedImageView: TBAnimatedImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredBlurredStatusBarStyleBarStyle = .NoneLightContent

        logoImageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        logoImageView.layer.shadowOpacity = 0.16

        animatedImageView.animationImages = images
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.animatedImageView.startAnimating()
        }
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.viewControllers.removeAtIndex(0)
    }
}
