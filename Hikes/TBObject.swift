//
//  TBObject.swift
//  Hikes
//
//  Created by James Hildensperger on 8/20/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

private var dateFormatter: NSDateFormatter = {
    let _dateFormatter = NSDateFormatter()
    _dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
   return _dateFormatter
}()

func transformedValue (type: PropertyType, object: AnyObject) -> AnyObject? {
    switch type {
        case .Int:
            return object is Int ? object : object.integerValue
        case .Bool:
            return object is Bool ? object : object.boolValue
        case .Double:
            return object is Double ? object : object.doubleValue
        case .Float:
            return object is Float ? object : object.floatValue
        case .String:
            return object is String ? object : object.stringValue
        case .Data:
            return object is NSData ? object : object.data
        case .Date:
            if object is NSDate {
                return object
            } else if let stringObject = object as? String {
                return dateFormatter.dateFromString(stringObject)
            } else {
                return nil
            }
        case .Object:
            return object is Object ? object : nil
        case .Array:
            return object is [AnyObject] ? object : nil
        default:
            return nil
    }
}

class TBObject: Object {
    dynamic var identifier: String = ""
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    class func mapping () -> [String: String]? {
        return nil
    }
    
    class func flatten (dictionary: [String: AnyObject]) -> [String: AnyObject] {
        return dictionary
    }
    
    class func map(dictionary: [String: AnyObject]) -> [String: AnyObject] {
        var _map = [String: AnyObject]()
        
        if let mapping = self.mapping() {
            let flattenedDictionary = self.flatten(dictionary)
            
            do {
                let classSchema = try Realm().schema[className()]!
                for (propertyName, keypath) in mapping {
                    let propertyType = classSchema[propertyName]!.type
                    
                    if let value: AnyObject = (flattenedDictionary as NSDictionary).valueForKeyPath(keypath) {
                        if let transformedValue: AnyObject = transformedValue(propertyType, object: value) {
                            _map[propertyName] = transformedValue
                        }
                    }
                }
            } catch {
                
            }
        }
        return _map
    }
}
