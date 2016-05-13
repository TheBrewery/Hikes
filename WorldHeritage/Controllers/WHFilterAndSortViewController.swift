//
//  WHFilterAndSortViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/17/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class WHSortTableViewCell: UITableViewCell {
    var property = "date"
    var ascending = true

    var sortDescriptor: SortDescriptor {
        return SortDescriptor(property: property, ascending: ascending)
    }
}

class WHFilterTableViewCell: UITableViewCell {

}

class WHFilterAndSortViewController: TBBaseViewController {
    lazy var closeButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)

        let button = TBCircularIconButton(icon: Ionic.Close, frame: buttonFrame, target: self, action: #selector(WHFilterAndSortViewController.didTapCloseButton))
        button.iconColor = UIColor.whiteColor()
        button.color = UIColor.whDarkBlueColor()

        button.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])

        return button
    }()

    var tableView: UITableView!

    let sortProperties: [(title: String, property: String)] = [("Inscription Date", "identifier"), ("Distance", "distance"), ("Site Name", "name"), ("Region", "region"), ("Country", "countries")]

//    struct filter {
//        let key: String
//        let values: [String]
//
//        var predicate: NSPredicate {
//            let predicates = values.map {
//                return NSPredicate(format: "criteria == @%", argumentArray: [$0])
//            }
//            return NSCompoundPredicate(orPredicateWithSubpredicates: predicates)
//        }
//    }
//
//    let filters = ["criteria", "regions", "countries", "years"]

    var sortOrFilterDidChange: ((NSPredicate?, [SortDescriptor]?) -> ())?

    var filterPredicate: NSPredicate?
    var sortDescriptors: [SortDescriptor]?

    init(filterPredicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) {
        super.init(nibName: nil, bundle: nil)
        self.filterPredicate = filterPredicate
        self.sortDescriptors = sortDescriptors
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func loadView() {
        view = UIView(frame: UIScreen.mainScreen().bounds)

        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        view.addSubview(closeButton)

        let horizontalConstraint = NSLayoutConstraint(item: closeButton, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: closeButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 30)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()

        tableView.registerClass(WHSortTableViewCell.self, forCellReuseIdentifier: "SortCell")
    }

    @objc private func didTapCloseButton() {
        sortOrFilterDidChange?(filterPredicate, sortDescriptors)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension WHFilterAndSortViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = tableView.cellForRowAtIndexPath(indexPath) as? WHSortTableViewCell else {
            return
        }

        guard var sortDescriptors = sortDescriptors else {
            return self.sortDescriptors = [cell.sortDescriptor]
        }

        guard let index = sortDescriptors.indexOf(cell.sortDescriptor) else {
            return self.sortDescriptors = [cell.sortDescriptor]
        }

        if cell.ascending {
            cell.ascending = false
        } else {
            sortDescriptors.removeAtIndex(index)
        }

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
}

extension WHFilterAndSortViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : sortProperties.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.width - 20, height: 20))
        headerLabel.text = "Sort"
        return headerLabel
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath) as! WHSortTableViewCell
        cell.textLabel?.text = sortProperties[indexPath.row].title
        cell.property = sortProperties[indexPath.row].property

        guard let sortDescriptors = sortDescriptors else {
            return cell
        }

        guard let ascending = sortDescriptors.filter({ $0.property == sortProperties[indexPath.row].property }).first?.ascending else {
            return cell
        }

        let icon = ascending ? Ionic.ArrowDownA : Ionic.ArrowUpA
        cell.detailTextLabel?.attributedText = icon.attributedStringWithFontSize(20)

        return cell
    }
}
