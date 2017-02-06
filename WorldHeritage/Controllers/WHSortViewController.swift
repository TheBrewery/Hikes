//
//  WHSortViewController.swift
//  World Heritage
//
//  Created by James Hildensperger on 5/22/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import Static

class WHSortViewController: TableViewController {
    let sortProperties: [(title: String, property: String)] = [("Inscription Date", "identifier"), ("Distance", "distance"), ("Site Name", "name"), ("Region", "region"), ("Country", "countries")]
    
    var sortDescriptor: SortDescriptor?
    
    init(sortDescriptor: SortDescriptor? = nil) {
        super.init(style: .Plain)
        self.sortDescriptor = sortDescriptor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let footer = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.view.frame.width, height: 1.0)))
        let rows = sortProperties.enumerate().map({ return row($0.index, sortProperty: $0.element) })
        
        dataSource.sections = [
            Section(rows: rows, footer: .View(footer))
        ]
    }
    
    func row(index: Int, sortProperty: (title: String, property: String)) -> Row {
        let arrowLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        arrowLabel.textColor = UIColor.blackColor()
        arrowLabel.font = UIFont.ionicFontOfSize(28)
        
        if sortDescriptor?.property == sortProperty.property {
            arrowLabel.text! = sortDescriptor!.ascending ? Ionic.IosArrowThinDown.rawValue : Ionic.IosArrowThinUp.rawValue
        }
        
        let row = Row(text: sortProperty.title, cellClass: WHTableViewCell.self, accessory: .View(arrowLabel), selection: { [unowned self] in
            var isAscending = true
            
            if self.sortDescriptor?.property == sortProperty.property {
                isAscending = !self.sortDescriptor!.ascending
                self.sortDescriptor = SortDescriptor(property: sortProperty.property, ascending: isAscending)
            } else {
                self.sortDescriptor = SortDescriptor(property: sortProperty.property)
            }
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.20 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) { [weak self] in
                guard let _self = self else {
                    return
                }
                
                _self.deselectRows()
                
                let label = _self.dataSource.sections[0].rows[index].accessory.view as? UILabel
                label?.text = isAscending ? Ionic.IosArrowThinUp.rawValue : Ionic.IosArrowThinDown.rawValue
            }
            })
        
        return row
    }
    
    func deselectRows() {
        let selectedRows = self.dataSource.sections[0].rows.filter {
            guard let label = $0.accessory.view as? UILabel where label.text != nil else {
                return false
            }
            return true
        }
        
        for row in selectedRows {
            let label = row.accessory.view as? UILabel
            label?.text = nil
        }
    }
}
