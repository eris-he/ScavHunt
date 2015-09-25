//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Apple on 9/24/15.
//  Copyright © 2015 Apple. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    
    let myManager = ItemsManager()
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier=="DoneItem"{
            let addVC = segue.sourceViewController as! AddViewController
            if let newItem = addVC.newItem{
                myManager.items += [newItem]
                myManager.save()
                let indexPath=NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) //as! UTableViewCell
        
        let item=myManager.items[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        return cell
    }
}