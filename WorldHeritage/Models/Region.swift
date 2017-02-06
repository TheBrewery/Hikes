//
//  Region.swift
//  World Heritage
//
//  Created by James Hildensperger on 6/6/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Region: TBRealmObject {
    dynamic var name: String = ""
    let sites = LinkingObjects(fromType: Site.self, property: "region")
}
