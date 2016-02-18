//
//  TBAnimatedLaunchViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/18/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func fillAndCenter(view: UIView) {
        self.addSubview(view)
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[view]|", options: .AlignAllCenterX, metrics: nil, views: ["view" : view]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[view]|", options: .AlignAllCenterY, metrics: nil, views: ["view" : view]))
    }
}

class TBAnimatedLaunchViewController: UIViewController {
    var images = [UIImage(named: "colossem")!]
    
    let foregroundImageView = UIImageView(frame: UIScreen.mainScreen().applicationFrame)
    let backgroundImageView = UIImageView(frame: UIScreen.mainScreen().applicationFrame)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(foregroundImageView)
    }
}