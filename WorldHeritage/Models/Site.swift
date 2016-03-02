//
//  Site.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/19/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import MapKit

struct SitesRealmDataSource: TBRealmDataSource {
    typealias ObjectType = Site
    typealias ReturnType = ObjectType

    var predicate: NSPredicate?
    var sortDescriptors: [SortDescriptor]?

    var fetchedResults: Results<ObjectType>!
    var fetchedObjects = [ReturnType]()

    init(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor]? = nil) {
        self.predicate = predicate
        self.sortDescriptors = sortDescriptors
        fetch()
    }
}


//private let StringToIntTransform = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
private let StringToDoubleTransform = TransformOf<Double, String>(fromJSON: { Double($0!) }, toJSON: { $0.map { String($0) } })

class Site: TBRealmObject, Mappable {
    private dynamic var criteriaString: String = ""
    private dynamic var urlString: String = ""
    private dynamic var imageUrlString: String = ""

    dynamic var lat: Double = 0.0
    dynamic var lng: Double = 0.0

    dynamic var extensionType: Int = 0
    dynamic var revision: Int = 0

    dynamic var countries: String = ""
    dynamic var category: String = ""
    dynamic var historicalDescription: String = ""
    dynamic var inscriptionYear: String = ""
    dynamic var location: String = ""
    dynamic var name: String = ""
    dynamic var region: String = ""
    dynamic var shortDescription: String = ""
    dynamic var countryIso: String = ""
    dynamic var danger: String = ""
    dynamic var transboundary: String = ""
    dynamic var fullDescription: String = ""
    dynamic var justification: String = ""
    dynamic var saved: Bool = false

    let images = List<Image>()

    var criteria: [String]? {
        return [criteriaString]
    }

    var url: NSURL? {
        return NSURL(string: urlString)
    }

    var imageUrl: NSURL? {
        return NSURL(string: imageUrlString)
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(lat, lng)
    }

    func mapping(map: Map) {
        identifier <- map["id_number"]
        name <- map["site"]
        inscriptionYear <- map["date_inscribed"]
        location <- map["location"]
        countries <- map["states"]
        category <- map["category"]
        historicalDescription <- map["historical_description"]
        criteriaString <- map["criteria_txt"]
        region <- map["region"]
        shortDescription <- map["short_description"]
        countryIso <- map["iso_code"]
        danger <- map["danger"]
        transboundary <- map["transboundary"]
        fullDescription <- map["long_description"]
        extensionType <- map["extension"]
        justification <- map["justification"]
        revision <- map["revision"]
        urlString <- map["http_url"]
        imageUrlString <- map["image_url"]
        lat <- (map["latitude"], StringToDoubleTransform)
        lng <- (map["longitude"], StringToDoubleTransform)
    }

    required convenience init?(_ map: Map) {
        self.init()
        mapping(map)
    }
}
