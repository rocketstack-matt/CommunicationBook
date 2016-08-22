//
//  MainMenuContainerController.swift
//  CommunicationBook
//
//  Created by Matthew Bain on 22/08/2016.
//  Copyright © 2016 Codeghost Ltd. All rights reserved.
//

import Foundation
import UIKit

class MainMenuContainerController: UICollectionViewController {
    
    private let REUSE_IDENTIFIER = "section"
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch(indexPath.section, indexPath.row) {
        case (0,0):
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("family", forIndexPath: indexPath)
            return cell
        case (0,1):
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("bath", forIndexPath: indexPath)
            return cell
        case (0,2):
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("bed", forIndexPath: indexPath)
            return cell
        case (0,3):
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("sing", forIndexPath: indexPath)
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("family", forIndexPath: indexPath)
            return cell
        }
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
}