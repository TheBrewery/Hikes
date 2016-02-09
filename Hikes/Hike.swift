//
//  Hike.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

private let ImagesRemoteKey = "ImagesRemoteKey"

private var _mapping: [String: String] = {
    return [
        "identifier" : "id",
        "slug": "string_id",
        "name": "name",
        "locality": "locality",
        "distance": "distance",
        "elevationGain": "elevation_gain",
        "elevationMax": "elevation_max",
        "descriptionHtml": "description",
        "strippedDescription": "stripped_description",
        "permitInfo": "permit",
        "isFeatured": "featured",
        "lat": "location.latitude",
        "lng": "location.longitude",
        "creationDate": "creation_time",
        "editDate": "edit_time",
        "images": ImagesRemoteKey]
}()

extension String {
    func stringByStrippingHTML() -> String {
        let string = self.stringByReplacingOccurrencesOfString("<[^>]*>", withString: "", options: .RegularExpressionSearch, range: nil)
        return string.stringByReplacingOccurrencesOfString("(\\r|\\n){3,}", withString: "\n\n", options: .RegularExpressionSearch, range: nil)
    }
}

class Hike: TBObject {
    dynamic var slug: String = ""
    dynamic var name: String = ""
    dynamic var descriptionHtml: String = ""
    dynamic var strippedDescription: String = ""
    dynamic var locality: String = ""
    dynamic var distance: Double = 0.0
    dynamic var elevationGain: Double = 0.0
    dynamic var elevationMax: Double = 0.0
    dynamic var creationDate: NSDate = NSDate(timeIntervalSince1970: 0)
    dynamic var editDate: NSDate = NSDate(timeIntervalSince1970: 0)
    dynamic var permitInfo: String = ""
    dynamic var isFeatured: Bool = false
    dynamic var lat: Double = 0.0
    dynamic var lng: Double = 0.0
    let images = List<Image>()

    override class func mapping() -> [String: String] {
        return _mapping
    }
    
    override class func flattenMap (var dictionary: [String: AnyObject]) -> [String: AnyObject] {
        if let string = dictionary["description"] as? String {
            dictionary["stripped_description"] = string.stringByStrippingHTML()
        }
        
        var imageDictionaries = [[String: AnyObject]]()
        
        let imageTypesByKey = ["photos_generic": ImageType.Generic,
                                "photo_facts": ImageType.Facts,
                                "photo_landscape": ImageType.Landscape,
                                "photo_preview": ImageType.Preview]
        
        func addImageMapping (dictionary: [String : AnyObject], type: ImageType) {
            var mutableImageMapping = Image.map(dictionary)
            mutableImageMapping["type"] = type.rawValue
            imageDictionaries.append(mutableImageMapping)
        }
        
        for (key, type) in imageTypesByKey {
            if let dictionaries = dictionary[key] as? [[String: AnyObject]] {
                for dictionary in dictionaries {
                    addImageMapping(dictionary, type: type)
                }
            } else if let dictionary = dictionary[key] as? [String: AnyObject] {
                addImageMapping(dictionary, type: type)
            }
        }
        
        dictionary[ImagesRemoteKey] = imageDictionaries
        
        return dictionary
    }
}