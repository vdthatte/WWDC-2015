//
//  History.swift
//  VidyadharThatte
//
//  Created by Vidyadhar V. Thatte on 4/26/15.
//  Copyright (c) 2015 Vidyadhar V Thatte. All rights reserved.
//

import UIKit
import Parse

class History: UITableViewController, UITableViewDataSource, UITableViewDelegate{
    
    var previousLocations = []
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return previousLocations.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cellItem  : UITableViewCell?
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        let temp = previousLocations[indexPath.row] as! NSString
        cell.textLabel?.text = temp as String
        return cell
    }

    

}
