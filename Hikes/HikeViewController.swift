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
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}