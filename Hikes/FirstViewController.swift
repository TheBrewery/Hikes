//
//  FirstViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 8/19/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class HikeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var rightLabel: UILabel?
}

class FirstViewController: UICollectionViewController {
    let HikeCollectionViewCellIdentifier = "HikeCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark - UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Realm().objects(Hike).count
    }
        
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HikeCollectionViewCellIdentifier, forIndexPath: indexPath) as! HikeCollectionViewCell
        let hike = Realm().objects(Hike)[indexPath.row]
        cell.titleLabel!.text = hike.name
        cell.subtitleLabel!.text = hike.locality
        cell.rightLabel!.text = String(format: "%.1f mi", hike.distance/1.6)
        cell.contentView.backgroundColor = UIColor.purpleColor()
        return cell
    }
}

