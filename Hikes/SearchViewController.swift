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

private func runOnMainThread(block: () -> Void) {
    if NSThread.isMainThread() {
        block()
    } else {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            block()
        })
    }
}

class HikesSearchCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class SearchViewController: UITableViewController {
    
    var dataSource = SearchDataSource()
    
    var searchText = String() {
        didSet {
            refreshSearchResults()
        }
    }
    
    private let searchQueue: NSOperationQueue = {
        let queue = NSOperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    
    // MARK: Methods
    
    /// Performs the search again with the current text input and base predicate
    func refreshSearchResults() {
        self.dataSource.searchText = searchText
        
        let searchOperation = NSBlockOperation { [weak self] () -> Void in
            if let strongSelf = self {
                strongSelf.dataSource.fetch()
                
                if strongSelf.isViewLoaded() {
                    runOnMainThread({ [weak strongSelf] () -> Void in
                        strongSelf?.tableView.reloadData()
                    })
                }
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
}

extension Hike {
    func titleForSearchText(searchText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: name.capitalizedString)
        
        do {
            let regex = try NSRegularExpression(pattern: searchText, options: NSRegularExpressionOptions.CaseInsensitive)
            for match in regex.matchesInString(name, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, name.characters.count)) {
                attributedString.addAttributes([NSBackgroundColorAttributeName : UIColor.yellowColor()], range: match.range)
            }
            
        } catch {
            
        }
        return attributedString
    }
    
    func descriptionForSearchText(searchText: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: strippedDescription)
        
        do {
            let regex = try NSRegularExpression(pattern: searchText, options: NSRegularExpressionOptions.CaseInsensitive)
            for match in regex.matchesInString(strippedDescription, options: NSMatchingOptions.ReportCompletion, range: NSMakeRange(0, strippedDescription.characters.count)) {
                attributedString.addAttributes([NSBackgroundColorAttributeName : UIColor.yellowColor()], range: match.range)
            }
            
        } catch {
            
        }
        return attributedString
    }
}

struct SearchDataSource: TBDataSource {
    private var internalObjects: ResultType!
    
    // MARK: - Protocol
    
    typealias ObjectType = (titleAttributedString: NSAttributedString, descriptionAttributedString: NSAttributedString)
    typealias ResultType = [(titleAttributedString: NSAttributedString, descriptionAttributedString: NSAttributedString)]
    
    init(predicate: NSPredicate? = nil, sortDescriptors: [SortDescriptor]? = nil) {
        self.predicate = predicate
        self.sortDescriptors = sortDescriptors
        fetch()
    }
    
    var predicate: NSPredicate?
    var sortDescriptors: [SortDescriptor]?
    var searchText = "" {
        didSet {
            predicate = searchPredicate(searchText)
        }
    }
    
    var count: Int {
        return internalObjects.count
    }
    
    subscript (indexPath: NSIndexPath) -> ObjectType? {
        guard internalObjects.indices.contains(indexPath.row) else {
            return nil
        }
        return internalObjects[indexPath.row]
    }
    
    // MARK: Private
    
    private func searchPredicate(text: String?) -> NSPredicate? {
        guard let searchText = text where !searchText.isEmpty else {
            return nil
        }
        return NSPredicate(format: "name contains[c] %@ OR descriptionHtml contains[c] %@", argumentArray: [searchText, searchText])
    }
    
    // MARK: - Public
    
    mutating func fetch(completion: ((ResultType?)->())? = nil) {
        do {
            var fetchedObjects: Results<Hike>
            if let predicate = predicate, let sortDescriptors = sortDescriptors {
                fetchedObjects = try Realm().objects(Hike).filter(predicate).sorted(sortDescriptors)
            } else if let predicate = predicate {
                fetchedObjects = try Realm().objects(Hike).filter(predicate)
            } else if let sortDescriptors = sortDescriptors {
                fetchedObjects = try Realm().objects(Hike).sorted(sortDescriptors)
            } else {
                fetchedObjects = try Realm().objects(Hike)
            }
            
            internalObjects = fetchedObjects.map({ (hike) -> (titleAttributedString: NSAttributedString, descriptionAttributedString: NSAttributedString) in
                return (hike.titleForSearchText(searchText), hike.descriptionForSearchText(searchText))
            })
            
            completion?(internalObjects)

        } catch {
            completion?(nil)
        }
    }
}

// MARK: UITableViewDelegate

extension SearchViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 128.0
    }
}

// MARK: UITableViewControllerDataSource

extension SearchViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("HikeSearchCell", forIndexPath: indexPath) as! HikesSearchCell

        if let data = dataSource[indexPath] {
            cell.titleLabel.attributedText = data.titleAttributedString
            cell.descriptionLabel.attributedText = data.descriptionAttributedString
        }
        
        return cell
    }
}