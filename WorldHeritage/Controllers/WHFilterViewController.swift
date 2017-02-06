//
//  WHFilterViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 5/22/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import Static

private let mainThreadRealm = try! Realm()

class WHIndentedSubtitleCell: UITableViewCell, CellType {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    // MARK: - Private
    
    func configureView() {
        self.indentationLevel = 1
        self.textLabel?.font = UIFont.regularFontOfSize(18.0)
        self.detailTextLabel?.font = UIFont.regularFontOfSize(14.0)
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor.whDarkBlueColor().colorWithAlphaComponent(0.2)
    }
}


class WHFilterRelationshipViewController: WHFilterPropertyViewController {
    var relationship: String!
    
    init(objectType: TBRealmObject.Type, property: String, relationship: String, title: String) {
        super.init(objectType: objectType, property: property, title: title)
        self.relationship = relationship
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override func rows() -> [Row] {
        let objects = mainThreadRealm.objects(self.objectType).sorted(self.property)
        
        return objects.enumerate().map {
            let object = $0.element
            let index = $0.index
            
            let count = object.valueForKey(relationship)!.count!
            let text = object.valueForKey(property)! as! String
            var row = Row(text: text, detailText: "\(count)", cellClass: WHIndentedSubtitleCell.self)
            
            row.selection = { [unowned self] in
                let indexOfObject = self.selectedObjects.indexOf(text)
                
                if indexOfObject != nil {
                    self.selectedObjects.removeAtIndex(indexOfObject!)
                } else {
                    self.selectedObjects.append(text)
                }
                
                self.didUpdateSelectedObjects?()
                self.dataSource.sections[0].rows[index].accessory = indexOfObject == nil ? .Checkmark : .None
            }
            
            return row
        }
    }
}

class WHFilterPropertyViewController: TableViewController {
    private var totalObjectCount = 0
    
    var subtitle = "None"
    var property: String!
    var objectType: TBRealmObject.Type!
    var didUpdateSelectedObjects: (() -> Void)?

    
    var selectedObjects = [String]() {
        didSet {
            if selectedObjects.isEmpty {
                subtitle = "None"
            } else {
                subtitle = selectedObjects.count == totalObjectCount ? "All" : selectedObjects.joinWithSeparator(", ")
            }
        }
    }
    
    init(objectType: TBRealmObject.Type, property: String, title: String) {
        super.init(style: .Plain)
        self.objectType = objectType
        self.property = property
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.tableView.scrollEnabled = false
        
        let footer = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.width, height: 1.0)))
        
        dataSource.sections = [
            Section(rows: rows(), footer: .View(footer))
        ]
    }
    
    // MARK: - Private
    
    private func rows() -> [Row] {
        let objects = mainThreadRealm.objects(self.objectType).map({ $0.valueForKey(property)! })
        let countedSet = NSCountedSet(array: objects)
        self.totalObjectCount = countedSet.count
        
        return countedSet.sort({
            let first = $0 as! String
            let second = $1 as! String
            return first < second
        }).enumerate().map {
            let object = $0.element as! String
            let index = $0.index
            
            let count = countedSet.countForObject(object)
            var row = Row(text: object, detailText: "\(count)", cellClass: WHIndentedSubtitleCell.self)
            
            row.selection = { [unowned self] in
                let indexOfObject = self.selectedObjects.indexOf(object)
                
                if indexOfObject != nil {
                    self.selectedObjects.removeAtIndex(indexOfObject!)
                } else {
                    self.selectedObjects.append(object)
                }
                
                self.didUpdateSelectedObjects?()
                self.dataSource.sections[0].rows[index].accessory = indexOfObject == nil ? .Checkmark : .None
            }
            
            return row
        }
    }
}

class WHFilterViewController: TableViewController {
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
    
    let inscriptionYearsViewController = WHFilterPropertyViewController(objectType: Site.self, property: "inscriptionYear", title: "Inscription Year")
    
    let regionsViewController = WHFilterRelationshipViewController(objectType: Region.self, property: "name", relationship: "sites", title: "Regions")
    let countriesViewController = WHFilterRelationshipViewController(objectType: Country.self, property: "name", relationship: "sites", title: "Countries")
    let criteriaViewController = WHFilterRelationshipViewController(objectType: Criteria.self, property: "identifier", relationship: "sites", title: "Criteria")
    
    var filterPredicate: NSPredicate?
    
    init(filterPredicate: NSPredicate? = nil) {
        super.init(style: .Plain)
        self.filterPredicate = filterPredicate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.sections = [
            createSection(withViewController: regionsViewController, forSection: 0),
            createSection(withViewController: inscriptionYearsViewController, forSection: 1),
            createSection(withViewController: countriesViewController, forSection: 2),
            createSection(withViewController: criteriaViewController, forSection: 3)
        ]
    }
    
    // MARK: - Private
    
    private func titleRow(forViewController viewController: WHFilterPropertyViewController, inSection section: Int) -> Row {
        var row = Row(text: viewController.title, detailText: viewController.subtitle, cellClass: SubtitleCell.self)
        
        row.selection = { [unowned self, unowned viewController] in
            if self.dataSource.sections[section].rows.count > 1 {
                self.dataSource.sections[section].rows.removeAtIndex(1)
            } else {
                let size = CGSize(width: UIScreen.mainScreen().bounds.width, height: viewController.tableView.contentSize.height)
                viewController.view.frame.size = size
                
                let row = Row(customView: viewController.view, cellClass: CustomViewCell.self)
                self.dataSource.sections[section].rows.append(row)
            }
        }
        
        return row
    }

    private func createSection(withViewController viewController: WHFilterPropertyViewController, forSection section: Int) -> Section {
        let footer = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.width, height: 1.0)))
        
        self.addChildViewController(viewController)
        viewController.willMoveToParentViewController(self)
        viewController.didMoveToParentViewController(self)
        viewController.view.layoutIfNeeded()
        
        viewController.didUpdateSelectedObjects = { [unowned self, unowned viewController] in
            self.dataSource.sections[section].rows[0] = self.titleRow(forViewController: viewController, inSection: section)
        }
        
        let initalTitleRow = titleRow(forViewController: viewController, inSection: section)
        return Section(rows: [initalTitleRow], footer: .View(footer))
    }
}