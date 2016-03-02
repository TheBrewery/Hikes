//
//  TBParallaxFlowLayout.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/1/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class TBParallaxFlowLayout: UICollectionViewFlowLayout {
    let maxParallaxOffset: CGFloat = 30.0

    override class func layoutAttributesClass() -> AnyClass {
        return TBParallaxLayoutAttributes.self
    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributesForElements = super.layoutAttributesForElementsInRect(rect) as? [TBParallaxLayoutAttributes] else {
            return nil
        }

        for layoutAttributes in layoutAttributesForElements {
            if layoutAttributes.representedElementCategory == .Cell {
                layoutAttributes.parallaxOffset = parallaxOffsetForLayoutAttributes(layoutAttributes)
            }
        }
        return layoutAttributesForElements
    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let layoutAttributes = super.layoutAttributesForItemAtIndexPath(indexPath) as! TBParallaxLayoutAttributes
        layoutAttributes.parallaxOffset = parallaxOffsetForLayoutAttributes(layoutAttributes)
        return layoutAttributes
    }

    func parallaxOffsetForLayoutAttributes(layoutAttributes: TBParallaxLayoutAttributes) -> CGPoint {
        let collectionViewBounds = collectionView!.bounds
        let collectionViewCenter = CGPoint(x: collectionViewBounds.minX, y: collectionViewBounds.midY)
        let cellCenter = layoutAttributes.center
        let centerOffset = CGPointMake(collectionViewCenter.x - cellCenter.x, collectionViewCenter.y - cellCenter.y)

        let cellSize = layoutAttributes.size
        let maxVerticalOffsetWhereCellIsStillVisible = (collectionViewBounds.size.height / 2) + (cellSize.height / 2)
        let scaleFactor = maxParallaxOffset / maxVerticalOffsetWhereCellIsStillVisible

        let parallaxOffset = CGPointMake(0.0, centerOffset.y * scaleFactor);

        return parallaxOffset;
    }
}
