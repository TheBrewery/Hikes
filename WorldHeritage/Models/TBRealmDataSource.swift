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
        return fetchedResults.count
    }

    subscript (indexPath: NSIndexPath) -> ObjectType? {
        return self.fetchedResults[indexPath.row]
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
