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

protocol TBDataSource {
    typealias ObjectType
    typealias ResultType
    
    var predicate: NSPredicate? { get set }
    var sortDescriptors: [SortDescriptor]? { get set }
    var count: Int { get }
    subscript(indexPath: NSIndexPath) -> ObjectType? { get }
    mutating func fetch(completion: ((ResultType?)->())?)
}

import RealmSwift

struct HikesDataSource: TBDataSource {
    private var internalObjects: ResultType!
    
    // MARK: - Protocol
    
    typealias ObjectType = Hike
    typealias ResultType = Results<Hike>
    
    init(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor]? = nil) {
        self.predicate = predicate
        self.sortDescriptors = sortDescriptors
        fetch()
    }
    
    var predicate: NSPredicate?
    var sortDescriptors: [SortDescriptor]?
    
    var count: Int {
        return internalObjects.count
    }
    
    subscript (indexPath: NSIndexPath) -> ObjectType? {
        guard internalObjects.indices.contains(indexPath.row) else {
            return nil
        }
        return internalObjects[indexPath.row]
    }
    
    // MARK: - Public
    
    mutating func fetch(completion: ((ResultType?)->())? = nil) {
        do {
            if let predicate = predicate, let sortDescriptors = sortDescriptors {
                internalObjects = try Realm().objects(Hike).filter(predicate).sorted(sortDescriptors)
                completion?(internalObjects)
            } else if let predicate = predicate {
                internalObjects = try Realm().objects(Hike).filter(predicate)
                completion?(internalObjects)
            } else if let sortDescriptors = sortDescriptors {
                internalObjects = try Realm().objects(Hike).sorted(sortDescriptors)
                completion?(internalObjects)
            } else {
                internalObjects = try Realm().objects(Hike)
                completion?(internalObjects)
            }
        } catch {
            completion?(nil)
        }
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