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
    
    var itemsList=["bring me the night", "send out the stars", "cause when I'm dreaming we don't seem so far"]
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) //as! UTableViewCell
        
        cell.textLabel?.text = itemsList[indexPath.row]
        
        return cell
    }
}