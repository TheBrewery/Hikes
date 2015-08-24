//
//  Image.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

private let baseImageUrlString = "http://assets.hike.io/hike-images/"
// small, medium, large.jpg

enum ImageSize: Int {
    case Small
    case Medium
    case Large
}

enum ImageType: String {
    case Generic = "Generic"
    case Facts = "Facts"
    case Landscape = "Landscape"
    case Preview = "Preview"
}

private var _mapping: [String: String] = {
    return [
        "identifier" : "id",
        "type": "type",
        "path": "string_id",
        "width": "width",
        "height": "height",
        "descriptionHtml": "alt",
        "attributionUrlString": "attribution_link"]
    }()

class Image : TBObject {
    dynamic var type: String = ImageType.Generic.rawValue
    dynamic var path: String = ""
    dynamic var descriptionHtml: String = ""
    dynamic var width: Float = 0.0
    dynamic var height: Float = 0.0
    dynamic var attributionUrlString: String = ""
    
    override class func mapping() -> [String: String] {
        return _mapping
    }
    
    func urlForImageSize (size: ImageSize = ImageSize.Medium) -> NSURL {
        switch size {
        case .Small:
            return NSURL(string: "\(baseImageUrlString)\(self.path)/small.jpg")!
        case .Large:
            return NSURL(string: "\(baseImageUrlString)\(self.path)/large.jpg")!
        default:
            return NSURL(string: "\(baseImageUrlString)\(self.path)/medium.jpg")!
        }
    }
}
