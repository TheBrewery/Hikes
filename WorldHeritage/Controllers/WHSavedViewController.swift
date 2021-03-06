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
    var emptyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureEmptyLabel()

        dataSource.predicate = NSPredicate(format: "saved == %@", argumentArray: [true])
        dataSource.fetch() { [weak self](objects) -> Void in
            guard let _self = self, let count = objects?.count else {
                return
            }
            _self.emptyLabel.alpha = CGFloat(!Bool(count))
        }

        notificationToken = dataSource.fetchedResults.addNotificationBlock { [weak self] (changes) -> Void in
            guard let _self = self else {
                return
            }

            let indexPathsToRemove = _self.collectionView.visibleCells().filter { (cell) -> Bool in
                    return !(cell as! WHSiteCollectionViewCell).site.saved
                }.map {
                    _self.collectionView.indexPathForCell($0)!
            }
            
            switch changes {
            case .Initial:
                break
            case .Update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
//                TODO
//                tableView.beginUpdates()
//                tableView.insertRowsAtIndexPaths(insertions.map { NSIndexPath(forRow: $0, inSection: 0) },
//                    withRowAnimation: .Automatic)
//                tableView.deleteRowsAtIndexPaths(deletions.map { NSIndexPath(forRow: $0, inSection: 0) },
//                    withRowAnimation: .Automatic)
//                tableView.reloadRowsAtIndexPaths(modifications.map { NSIndexPath(forRow: $0, inSection: 0) },
//                    withRowAnimation: .Automatic)
//                tableView.endUpdates()
//                let newAlpha = CGFloat(!Bool(results!.count))
//                if _self.emptyLabel.alpha != newAlpha {
//                    UIView.animateWithDuration(0.25) {
//                        _self.emptyLabel.alpha = newAlpha
//                    }
//                }
//                
//                guard indexPathsToRemove.count > 0 else {
//                    return
//                }
                break
            case .Error(let error):
                fatalError("\(error)")
                break
            }



            _self.collectionView.deleteItemsAtIndexPaths(indexPathsToRemove)
        }

    }

    // MARK: - Private

    private func configureEmptyLabel() {
        emptyLabel = UILabel(frame: view.bounds)
        emptyLabel.textAlignment = NSTextAlignment.Center
        emptyLabel.numberOfLines = 0

        let attributedString = NSMutableAttributedString(attributedString: Ionic.IosHeartOutline.attributedStringWithFontSize(140.0))
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, attributedString.string.characters.count))
        let noSaves = NSAttributedString(string: "\n\nYou haven't saved any sites yet", attributes: [NSFontAttributeName: UIFont.regularFontOfSize(20), NSForegroundColorAttributeName: UIColor.lightGrayColor()])

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacingBefore = 5
        paragraphStyle.alignment = .Center

        let exploreIcon = NSAttributedString(string: "\n\(Ionic.Compass.rawValue) ", attributes: [NSBaselineOffsetAttributeName: -4, NSParagraphStyleAttributeName: paragraphStyle, NSFontAttributeName : UIFont.ionicFontOfSize(26.0), NSForegroundColorAttributeName: UIColor.whDarkBlueColor()])
        let exploreString = NSAttributedString(string: "Explore World Heritage Sites", attributes: [NSFontAttributeName : UIFont.regularFontOfSize(20.0), NSForegroundColorAttributeName: UIColor.whDarkBlueColor()] )
        attributedString.appendAttributedString(noSaves)
        attributedString.appendAttributedString(exploreIcon)
        attributedString.appendAttributedString(exploreString)

        emptyLabel.attributedText = attributedString

        view.addSubview(emptyLabel)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WHSavedViewController.didTapEmptyLabel))
        emptyLabel.addGestureRecognizer(tapGestureRecognizer)
        emptyLabel.userInteractionEnabled = true
    }

    func didTapEmptyLabel() {
        self.tabBarController?.selectedIndex = 0
    }
}
