//
//  SearchViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import RBQFetchedResultsController

class HikesSearchCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class SearchViewController: UITableViewController {
    var sortPropertyKey: String? {
        didSet {
            self.refreshSearchResults()
        }
    }
    
    var sortAscending: Bool = true {
        didSet {
            self.refreshSearchResults()
        }
    }
    
    var realmConfiguration: Realm.Configuration {
        set {
            self.internalConfiguration = newValue
        }
        get {
            if let configuration = self.internalConfiguration {
                return configuration
            }
            
            return Realm.Configuration.defaultConfiguration
        }
    }
    
    /// The Realm in which the given entity resides in
    var realm: Realm {
        return try! Realm(configuration: self.realmConfiguration)
    }
    
    // MARK: Methods
    
    /// Performs the search again with the current text input and base predicate
    func refreshSearchResults(searchString: String? = nil) {
        let predicate = self.searchPredicate(searchString)
        
        let searchOperation = NSBlockOperation { [weak self] () -> Void in
            
            if let strongSelf = self {
                strongSelf.updateFetchedResultsController(predicate)
            }
        }
        
        self.searchQueue.cancelAllOperations()
        
        self.searchQueue.addOperation(searchOperation)
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 128
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refreshSearchResults()
    }
    
    // MARK: Private
    
    private var internalConfiguration: Realm.Configuration?
    
    private let searchQueue: NSOperationQueue = {
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()
    
    private lazy var fetchedResultsController: RBQFetchedResultsController = {
        let controller = RBQFetchedResultsController()
        return controller
    }()
    
    private var rlmRealm: RLMRealm {
        let configuration = self.toRLMConfiguration(self.realmConfiguration)
        return try! RLMRealm(configuration: configuration)
    }
    
    private func updateFetchedResultsController(predicate: NSPredicate?) {
        if let fetchRequest = self.searchFetchRequest("Hike", inRealm: self.rlmRealm, predicate: predicate, sortPropertyKey: self.sortPropertyKey, sortAscending: self.sortAscending) {
            
            self.fetchedResultsController.updateFetchRequest(fetchRequest, sectionNameKeyPath: nil, andPeformFetch: true)
            
            if self.isViewLoaded() {
                self.runOnMainThread({ [weak self] () -> Void in
                    self?.tableView.reloadData()
                    })
            }
        }
    }
    
    private func searchPredicate(text: String?) -> NSPredicate? {
        guard let searchText = text where !searchText.isEmpty else {
            return nil
        }
        return NSPredicate(format: "name contains[c] %@ OR descriptionHtml contains[c] %@", argumentArray: [searchText, searchText])

        
//            let nameExpression = NSExpression(forKeyPath: "name")
//            let decriptionHtmlExpression = NSExpression(forKeyPath: "descriptonHtml")
//            let textExpression = NSExpression(forConstantValue: text)
//            
//            let operatorType = NSPredicateOperatorType.ContainsPredicateOperatorType
//            
//            let options = NSComparisonPredicateOptions.CaseInsensitivePredicateOption
            
//            let namePredicate =
//            NSComparisonPredicate(leftExpression: nameExpression, rightExpression: text, modifier: NSComparisonPredicateModifier.DirectPredicateModifier, type: operatorType, options: options)
//            let namePredicate = NSComparisonPredicate(leftExpression: leftExpression, rightExpression: rightExpression, modifier: NSComparisonPredicateModifier.DirectPredicateModifier, type: operatorType, options: options)
//            
//            
//            if (self.basePredicate != nil) {
//                
//                let compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [self.basePredicate!, filterPredicate])
//                
//                return compoundPredicate
//            }
            
//            return filterPredicate
    }
    
    private func searchFetchRequest(entityName: String?, inRealm realm: RLMRealm?, predicate: NSPredicate?, sortPropertyKey: String?, sortAscending: Bool) -> RBQFetchRequest? {
        
        if entityName != nil && realm != nil {
            
            let fetchRequest = RBQFetchRequest(entityName: entityName!, inRealm: realm!, predicate: predicate)
            
            if (sortPropertyKey != nil) {
                
                let sort = RLMSortDescriptor(property: sortPropertyKey!, ascending: sortAscending)
                
                fetchRequest.sortDescriptors = [sort]
            }
            
            return fetchRequest
        }
        
        return nil
    }
    
    private func toRLMConfiguration(configuration: Realm.Configuration) -> RLMRealmConfiguration {
        let rlmConfiguration = RLMRealmConfiguration()
        
        if (configuration.path != nil) {
            rlmConfiguration.path = configuration.path
        }
        
        if (configuration.inMemoryIdentifier != nil) {
            rlmConfiguration.inMemoryIdentifier = configuration.inMemoryIdentifier
        }
        
        rlmConfiguration.encryptionKey = configuration.encryptionKey
        rlmConfiguration.readOnly = configuration.readOnly
        rlmConfiguration.schemaVersion = configuration.schemaVersion
        return rlmConfiguration
    }
    
    private func runOnMainThread(block: () -> Void) {
        if NSThread.isMainThread() {
            block()
        }
        else {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                block()
            })
        }
    }
}

// MARK: UITableViewDelegate
extension SearchViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 128.0
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
//        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Object
        
//        self.resultsDelegate.searchViewController(self, willSelectObject: object, atIndexPath: indexPath)
        
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
//        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Object
        
//        self.resultsDelegate.searchViewController(self, didSelectObject: object, atIndexPath: indexPath)
    }
}

// MARK: UITableViewControllerDataSource
extension SearchViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.numberOfSections()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchedResultsController.numberOfRowsForSectionIndex(section)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("HikeSearchCell", forIndexPath: indexPath) as! HikesSearchCell

        if let hike = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Hike {
            cell.titleLabel.text = hike.name.capitalizedString
            cell.descriptionLabel.text = hike.strippedDescription
        }
            
        return cell
    }
}