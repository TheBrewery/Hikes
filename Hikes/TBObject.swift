//
//  TBObject.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class TBObject: Object {
    dynamic var identifier: String = ""

    override static func primaryKey() -> String? {
        return "identifier"
    }
}
