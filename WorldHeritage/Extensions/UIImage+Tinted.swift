import Foundation
import UIKit

extension UIImage {
   func imageWithTintColor (tintColor:UIColor) -> UIImage {
        let imageBounds = CGRectMake( 0, 0, self.size.width, self.size.height )

        UIGraphicsBeginImageContextWithOptions( self.size, false, self.scale )
        let context: CGContextRef = UIGraphicsGetCurrentContext()!

        CGContextTranslateCTM( context, 0, self.size.height )
        CGContextScaleCTM( context, 1.0, -1.0 )
        CGContextClipToMask( context, imageBounds, self.CGImage )

        tintColor.setFill()
        CGContextFillRect( context, imageBounds )

        let tintedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return tintedImage
    }
}

