//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Apple on 9/24/15.
//  Copyright © 2015 Apple. All rights reserved.
//

// import Foundation
import UIKit

class ItemsManager{
    var items=[ScavengerHuntItem]()
    
    func archivePath() -> String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
                return documentsPath + "/ScavengerHuntItems"
            }
            assertionFailure("Could not determine where to save file")
            return nil
        }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(items, toFile: theArchivePath) {
                print("We saved!")
            }
            else {
            assertionFailure("Could not save to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                items = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [ScavengerHuntItem]
            }
        }
    }
    init() {
    unarchiveSavedItems()
    }
}
