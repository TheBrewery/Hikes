//
//  SearchViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 2/5/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class HikesSearchCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class WHSearchViewController: UITableViewController {
    var dataSource = SitesRealmDataSource()

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

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.estimatedRowHeight = 128
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshSearchResults()

        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            return
        }

        tableView.deselectRowAtIndexPath(selectedIndexPath, animated: true)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: Methods

    /// Performs the search again with the current text input and base predicate
    func refreshSearchResults() {
        print(searchText)
        self.dataSource.updatePredicate(searchText)

        let searchOperation = NSBlockOperation { [weak self] () -> Void in
            executeOn(.Main) {
                guard let _self = self else {
                    return
                }

                _self.dataSource.fetch({ [weak _self] (objects) -> () in
                    guard let __self = _self where __self.isViewLoaded() else {
                        return
                    }
                    __self.tableView.setContentOffset(CGPointZero, animated: false)
                    __self.tableView.reloadData()
                })
            }
        }

        self.searchQueue.cancelAllOperations()
        self.searchQueue.addOperation(searchOperation)
    }
}

// MARK: SitesRealmDataSource Extension

private extension SitesRealmDataSource {

    // MARK: Private
    private mutating func updatePredicate(text: String?) {
        guard let searchText = text where !searchText.isEmpty else {
            return predicate = nil
        }
        predicate = NSPredicate(format: "name contains[c] %@ OR fullDescription contains[c] %@", argumentArray: [searchText, searchText])
    }
}

// MARK: UITableViewDelegate

extension WHSearchViewController {
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 128.0
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let viewController = WHSiteViewController.createWith(dataSource[indexPath]!)
        self.showViewController(viewController, sender: nil)
    }
}

// MARK: UITableViewControllerDataSource

extension WHSearchViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("HikeSearchCell", forIndexPath: indexPath) as! HikesSearchCell

        if let site = dataSource[indexPath] {
            cell.titleLabel.text = site.name
            cell.descriptionLabel.text = site.shortDescription
            cell.selectionStyle = .Default
            let backgroundView = UIView(frame: cell.bounds)
            backgroundView.backgroundColor = UIColor.whDarkBlueColor().colorWithAlphaComponent(0.1)
            cell.selectedBackgroundView = backgroundView
        }

        return cell
    }
}
