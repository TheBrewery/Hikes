//
//  Hike.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Hike: TBObject {
    dynamic var slug: String = ""
    dynamic var name: String = ""
    dynamic var descriptionHtml: String = ""
    dynamic var locality: String = ""
    dynamic var distance: Double = 0.0
    dynamic var elevationGain: Double = 0.0
    dynamic var elevationMax: Double = 0.0
    dynamic var creationTime: NSDate = NSDate(timeIntervalSince1970: 0)
    dynamic var editTime: NSDate = NSDate(timeIntervalSince1970: 0)
    dynamic var permitInfo: String = ""
    dynamic var isFeatured: Bool = false
    dynamic var lat: Double = 0.0
    dynamic var lng: Double = 0.0
    let images = List<Image>()

    
    convenience init(dictionary: [String: AnyObject]) {
        self.init()
        identifier = String(dictionary["id"] as! Int)
        slug = dictionary["string_id"] as! String
        name = dictionary["name"] as! String
        locality = dictionary["locality"] as! String
        distance = dictionary["distance"] as! Double
        elevationGain = dictionary["elevation_gain"] as! Double
        elevationMax = dictionary["elevation_max"] as! Double
        
//        Creates a parsing issue
//        creationTime = dictionary["creation_time"] as! NSDate
//        editTime = dictionary["edit_time"] as! NSDate
        
        
        if let _descriptionHtml = dictionary["description"] as? String {
            descriptionHtml = _descriptionHtml
        }
        
        if let _permitInfo = dictionary["permit"] as? String {
            permitInfo = _permitInfo
        }

        if let _isFeatured = dictionary["featured"] as? Bool {
            isFeatured = _isFeatured
        }
        
        if let locationDictionary = dictionary["location"] as? [String: AnyObject] {
            lat = locationDictionary["latitude"] as! Double
            lng = locationDictionary["longitude"] as! Double
        }
        
        if let imageDictionaries = dictionary["photos_generic"] as? [[String: AnyObject]] {
            for imageDictionary in imageDictionaries {
                let image = Image(imageType: ImageType.Generic, dictionary: imageDictionary)
                images.append(image)
            }
        }
    }
}