//
//  Image.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import SKPhotoBrowser

private let whcUrlString = "http://whc.unesco.org/"

class Image: TBRealmObject, Mappable {
    dynamic var author: String = ""
    dynamic var source: String = ""
    dynamic var date: String = ""
    dynamic var descriptionString: String = ""
    dynamic var copyright: String = ""
    
    private dynamic var urlString: String?
    private dynamic var usageTermsUrlString: String?
    private dynamic var licenseUrlString: String?
    
    var licenseUrl: NSURL? {
        guard let path = licenseUrlString else {
            return nil
        }
        return NSURL(string: path)
    }
    
    dynamic var usageTermsUrl: NSURL? {
        guard let path = usageTermsUrlString else {
            return nil
        }
        return NSURL(string: whcUrlString + path)
    }
    
    dynamic var url: NSURL? {
        guard let path = urlString else {
            return nil
        }
        return NSURL(string: whcUrlString + path)
    }
    
    func mapping(map: Map) {
        identifier <- map["_id"]
        author <- map["author"]
        source <- map["source"]
        date <- map["date"]
        descriptionString <- map["description"]
        copyright <- map["copyright"]
        
        urlString <- map["path"]
        usageTermsUrlString <- map["termsPath"]
    }
    
    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
    
    func skphoto() -> SKPhoto? {
        guard let urlString = urlString else {
            return nil
        }
        
        let photo = SKPhoto.photoWithImageURL(urlString)
        photo.caption = copyright
        return photo
    }
}
