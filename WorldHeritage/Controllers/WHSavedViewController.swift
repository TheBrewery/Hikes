//
//  WHSavedViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/18/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class WHSavedViewController: WHSitesViewController {
    var notificationToken: NotificationToken!

    override func viewDidLoad() {
        dataSource.predicate = NSPredicate(format: "saved == %@", argumentArray: [true])
        dataSource.fetch()

        notificationToken = dataSource.fetchedResults.addNotificationBlock { [weak self] (results, error) -> () in
            guard let _self = self else {
                return
            }

            let indexPathsToRemove = _self.collectionView.visibleCells().filter { (cell) -> Bool in
                    return !(cell as! WHSiteCollectionViewCell).site.saved
                }.map {
                    _self.collectionView.indexPathForCell($0)!
            }

            guard indexPathsToRemove.count > 0 else {
                return
            }

            _self.collectionView.deleteItemsAtIndexPaths(indexPathsToRemove)
        }

        super.viewDidLoad()
    }
}
