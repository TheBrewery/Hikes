//
//  UIImage+Icons.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/1/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func imageWithIcon(icon: Ionic, fontSize: CGFloat, color: UIColor = UIColor.whiteColor(), backgroundColor: UIColor = UIColor.clearColor()) -> UIImage {
        return imageWithString(icon.rawValue, font: UIFont.ionicFontOfSize(fontSize), color: color, backgroundColor: backgroundColor)
    }

    private class func imageWithString(iconString: String, font: UIFont, color: UIColor, backgroundColor: UIColor) -> UIImage {
                let size = CGSize(width: font.pointSize, height: font.pointSize)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        let textRect = CGRect(origin: CGPointZero, size: size)

        //// Retangle Drawing
        let path = UIBezierPath(roundedRect: textRect, cornerRadius: font.pointSize/2.0)
        backgroundColor.setFill()
        path.fill()

        color.setFill()

        let mutableParagraphStyle = NSMutableParagraphStyle()
        mutableParagraphStyle.alignment = NSTextAlignment.Center

        let textAttributes = [NSFontAttributeName : font,
            NSForegroundColorAttributeName : color,
            NSBackgroundColorAttributeName : backgroundColor,
            NSParagraphStyleAttributeName: mutableParagraphStyle]

        (iconString as NSString).drawInRect(textRect, withAttributes: textAttributes)

        //Image returns
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
