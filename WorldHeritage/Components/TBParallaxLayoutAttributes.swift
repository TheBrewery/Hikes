//
//  TBParallaxLayoutAttributes.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/1/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class TBParallaxLayoutAttributes: UICollectionViewLayoutAttributes {
    var parallaxOffset: CGPoint!

    override func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = super.copyWithZone(zone)
        (copy as! TBParallaxLayoutAttributes).parallaxOffset = parallaxOffset
        return copy
    }


    override func isEqual(object: AnyObject?) -> Bool {
        guard let object = object as? TBParallaxLayoutAttributes where CGPointEqualToPoint(object.parallaxOffset, parallaxOffset) else {
            return false
        }
        return super.isEqual(object)
    }
}
