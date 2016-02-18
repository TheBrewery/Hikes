//
//  UIColor+Extensions.swift
//  Hikes
//
//  Created by James Hildensperger on 2/13/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import UIKit

extension UIColor {
    class func fromHex (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func darkerColorForColor(colorAdjustmentFactor: CGFloat? = 0.05) -> UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return UIColor(red: max(r - colorAdjustmentFactor!, 0.0), green: max(g - colorAdjustmentFactor!, 0.0), blue: max(b - colorAdjustmentFactor!, 0.0), alpha: a)
        }
        return UIColor()
    }
    
    func lighterColorForColor(colorAdjustmentFactor: CGFloat? = 0.05) -> UIColor {
        var r:CGFloat = 0, g:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        
        if getRed(&r, green: &g, blue: &b, alpha: &a){
            return UIColor(red: min(r + colorAdjustmentFactor!, 1.0), green: min(g + colorAdjustmentFactor!, 1.0), blue: min(b + colorAdjustmentFactor!, 1.0), alpha: a)
        }
        return UIColor()
    }
}