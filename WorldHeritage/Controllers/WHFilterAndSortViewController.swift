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

import Static

class WHTableViewCell: UITableViewCell, CellType {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Value1, reuseIdentifier: reuseIdentifier)
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    // MARK: - Private
    
    func configureView() {
        self.textLabel?.font = UIFont.regularFontOfSize(18.0)
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor.whDarkBlueColor().colorWithAlphaComponent(0.2)
    }
}

class WHFilterAndSortViewController: TBBaseViewController {
    @IBOutlet var containerView: UIView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var applyButton: UIButton!
    @IBOutlet var sortFilterSegmentedControl: UISegmentedControl!

    var sortOrFilterDidChange: ((NSPredicate?, SortDescriptor?) -> ())?

    var filterPredicate: NSPredicate?
    var sortDescriptor: SortDescriptor?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        addChildren()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapCancelButton() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)

    }
    
    @IBAction func didTapApplyButton() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        sortOrFilterDidChange?(filterPredicate, sortDescriptor)
    }
    
    @IBAction func segmentedControlDidChangeValue() {
        let viewToHide = self.containerView.subviews.last!
        let viewToShow = self.containerView.subviews.first!
        
        UIView.animateWithDuration(0.25, animations: {
            viewToHide.alpha = 0
        }) { (finished) in
            self.containerView.bringSubviewToFront(viewToShow)
            viewToHide.alpha = 1.0
        }
    }

    // MARK: - Private
    
    func configureView() {
        self.containerView.backgroundColor = UIColor(white: 0.97, alpha: 1.0)
        
        self.cancelButton.layer.borderWidth = 1
        self.cancelButton.layer.borderColor = self.cancelButton.titleColorForState(.Normal)?.CGColor
        
        self.sortFilterSegmentedControl.setTitleTextAttributes([NSFontAttributeName: UIFont.regularFontOfSize(16.0)], forState: .Normal)
        self.cancelButton.titleLabel?.font = UIFont.regularFontOfSize(18.0)
        self.applyButton.titleLabel?.font = UIFont.regularFontOfSize(18.0)
    }
    
    func addChildren() {
        let sortViewController = WHSortViewController(sortDescriptor: sortDescriptor)
        sortViewController.willMoveToParentViewController(self)
        sortViewController.view.frame = self.containerView.bounds
        self.containerView.addSubview(sortViewController.view)
        self.addChildViewController(sortViewController)
        sortViewController.didMoveToParentViewController(self)
        
        let filterViewController = WHFilterViewController()
        filterViewController.willMoveToParentViewController(self)
        filterViewController.view.frame = self.containerView.bounds
        self.containerView.insertSubview(filterViewController.view, belowSubview: sortViewController.view)
        self.addChildViewController(filterViewController)
        filterViewController.didMoveToParentViewController(self)
    }
}
