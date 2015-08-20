//
//  FirstViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 8/19/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import UIKit

class HikeCollectionViewCell: UICollectionViewCell {
    
}

class FirstViewController: UICollectionViewController {
    let HikeCollectionViewCellIdentifier = "HikeCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.registerClass(HikeCollectionViewCell.self, forCellWithReuseIdentifier: HikeCollectionViewCellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark - UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 190
    }
        
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HikeCollectionViewCellIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
        return cell
    }
}

