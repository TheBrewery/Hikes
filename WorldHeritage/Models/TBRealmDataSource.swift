//
//  TBRealmDataSource.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/19/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

private let mainThreadRealm = try! Realm()

protocol TBRealmDataSource {
    typealias ObjectType : Object
    typealias ReturnType
    
    var predicate: NSPredicate? { get set }
    var sortDescriptors: [SortDescriptor]? { get set }
    
    var fetchedResults: Results<ObjectType>! { get set }
    var fetchedObjects: [ReturnType] { get set }
    
    init(predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?)
}

extension TBRealmDataSource {
    var count: Int {
        var count = 0
        dispatch_sync(DispatchQueue(.Background)) {
            if let fetchedResults = self.fetchedResults {
                count = fetchedResults.count
            }
        }
        return count
    }
    
    subscript (indexPath: NSIndexPath) -> ObjectType? {
        var object: ObjectType? = nil
        dispatch_sync(DispatchQueue(.Background)) {
            object = self.fetchedResults[indexPath.row]
//            if let fetchedResults.indices.contains(indexPath.row) {
//                count = fetchedResults.count
//            }
        }
        return object
    }
    
    // MARK: - Public
    
    mutating func fetch(completion: (([ReturnType]?)->())? = nil) {
        if let predicate = predicate, let sortDescriptors = sortDescriptors {
            fetchedResults = mainThreadRealm.objects(ObjectType).filter(predicate).sorted(sortDescriptors)
        } else if let predicate = predicate {
            fetchedResults = mainThreadRealm.objects(ObjectType).filter(predicate)
        } else if let sortDescriptors = sortDescriptors {
            fetchedResults = mainThreadRealm.objects(ObjectType).sorted(sortDescriptors)
        } else {
            fetchedResults = mainThreadRealm.objects(ObjectType)
        }
        
        fetchedObjects.removeAll()
        for result in fetchedResults {
            let typedResult = result as! ReturnType
            fetchedObjects.append(typedResult)
        }
        completion?(fetchedObjects)
    }
}