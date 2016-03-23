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

private let StringToStringArrayTransform = TransformOf<[String], String>(fromJSON: { (string: String?) -> [String]? in
    guard let string = string else {
        return nil
    }
    return string.componentsSeparatedByCharactersInSet(NSCharacterSet.punctuationCharacterSet())
    }, toJSON: { (value: [String]?) -> String? in
        guard let value = value else {
            return nil
        }
        return value.joinWithSeparator(" ")
})


private let criteriaDescriptionDictionary = [
    "i": "to represent a masterpiece of human creative genius",
    "ii": "to exhibit an important interchange of human values, over a span of time or within a cultural area of the world, on developments in architecture or technology, monumental arts, town-planning or landscape design",
    "iii": "to bear a unique or at least exceptional testimony to a cultural tradition or to a civilization which is living or which has disappeared",
    "iv": "to be an outstanding example of a type of building, architectural or technological ensemble or landscape which illustrates (a) significant stage(s) in human history",
    "v": "to be an outstanding example of a traditional human settlement, land-use, or sea-use which is representative of a culture (or cultures), or human interaction with the environment especially when it has become vulnerable under the impact of irreversible change",
    "vi": "to be directly or tangibly associated with events or living traditions, with ideas, or with beliefs, with artistic and literary works of outstanding universal significance. (The Committee considers that this criterion should preferably be used in conjunction with other criteria)",
    "vii": "to contain superlative natural phenomena or areas of exceptional natural beauty and aesthetic importance",
    "viii": "to be outstanding examples representing major stages of earth's history, including the record of life, significant on-going geological processes in the development of landforms, or significant geomorphic or physiographic features",
    "ix": "to be outstanding examples representing significant on-going ecological and biological processes in the evolution and development of terrestrial, fresh water, coastal and marine ecosystems and communities of plants and animals",
    "x": "to contain the most important and significant natural habitats for in-situ conservation of biological diversity, including those containing threatened species of outstanding universal value from the point of view of science or conservation"
]

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


    var criteria: [(identifier: String, descriptionText: String)]? {
        let criteria = criteriaString.componentsSeparatedByCharactersInSet(NSCharacterSet.punctuationCharacterSet()).filter { !$0.isEmpty }
        return criteria.map {
            return ($0, criteriaDescriptionDictionary[$0]!)
        }
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


extension Site {
    func titleAttributedString(color: UIColor = UIColor.whDarkBlueColor()) -> NSAttributedString {
        let trimmedName = name.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let formattedCountries = " \(countries.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))"
        let attributedString = NSMutableAttributedString(string: trimmedName, attributes: [NSFontAttributeName: UIFont.regularFontOfSize(20), NSForegroundColorAttributeName: color])
        attributedString.appendAttributedString(NSAttributedString(string: formattedCountries, attributes: [NSFontAttributeName: UIFont.lightFontOfSize(20), NSForegroundColorAttributeName: color]))
        return attributedString
    }
}
