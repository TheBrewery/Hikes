//
//  UILabel+Extensions.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/8/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func sizeHeightToFit() {
        sizeToFit()

        let heightConstraints = constraints.filter {
            $0.firstAttribute == .Height
        }

        for heightConstraint in heightConstraints {
            heightConstraint.constant = frame.height
        }
    }
}
