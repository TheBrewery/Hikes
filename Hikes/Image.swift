//
//  Image.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

//    http://assets.hike.io/hike-images/
// small, medium, large.jpg

enum ImageType: String {
    case Generic = "Generic"
    case Facts = "Facts"
    case Landscape = "Landscape"
    case Preview = "Previce"
}

class Image : TBObject {
    dynamic var type: String = ImageType.Generic.rawValue
    dynamic var path: String = ""
    dynamic var descriptionString: String = ""
    dynamic var width: Float = 0.0
    dynamic var height: Float = 0.0
    dynamic var attributionUrlString: String = ""
    
    convenience init(imageType: ImageType, dictionary: [String: AnyObject]) {
        self.init()
        type = imageType.rawValue
        identifier = String(dictionary["id"] as! Int)
        path = dictionary["string_id"] as! String
        width = dictionary["width"] as! Float
        height = dictionary["height"] as! Float
        
        if let _descriptionString = dictionary["alt"] as? String {
            descriptionString = _descriptionString
        }
        
        if let _attributionUrlString = dictionary["attribution_link"] as? String {
            attributionUrlString = _attributionUrlString
        }
    }
}
