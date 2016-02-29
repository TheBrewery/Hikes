//
//  UIFont+Hikes.swift
//  Hikes
//
//  Created by James Hildensperger on 2/12/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func regularFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "GillSans", size: fontSize)!
    }

    class func lightFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "GillSans-Light", size: fontSize)!
    }
    
    class func semiboldFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "GillSans-Semibold", size: fontSize)!
    }

    class func boldFontOfSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "GillSans-Bold", size: fontSize)!
    }
}
