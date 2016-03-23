//
//  WHFilterAndSortViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/17/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class WHFilterAndSortViewController: TBBaseViewController {
    lazy var closeButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)

        let button = TBCircularIconButton(icon: Ionic.Close, frame: buttonFrame, target: self, action: "didTapCloseButton")
        button.iconColor = UIColor.whiteColor()
        button.color = UIColor.whDarkBlueColor()

        button.translatesAutoresizingMaskIntoConstraints = false

        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])

        self.view.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 30)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()

    @IBOutlet weak var tableView: UITableView!

//    let sortDescriptor: NSSortDescriptor!
    let sortKeys = ["date", "distance", "name", "region", "country"]

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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGrayColor()

        closeButton is TBCircularIconButton

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "SortCell")
    }

    @objc private func didTapCloseButton() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension WHFilterAndSortViewController: UITableViewDelegate {

}

extension WHFilterAndSortViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : sortKeys.count
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: tableView.frame.width - 20, height: 20))
        headerLabel.text = "Sort"
        return headerLabel
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("SortCell", forIndexPath: indexPath)

//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "")
//        }

        cell.textLabel?.text = sortKeys[indexPath.row]

        return cell
    }
}
