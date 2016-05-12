//
//  FirstSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 12/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class FirstSectionModule: TableSectionModule {
    override func registerNibsForCells() -> [AnyClass] {
        return [Example1TableViewCell.classForCoder(),
                Example2TableViewCell.classForCoder()]
    }
    
    override func registerClassForCells() -> [AnyClass] {
        return [UITableViewCell.classForCoder()]
    }
    
    override func createRows() {
        super.createRows()
        
        self.rows.append(String(Example1TableViewCell))
        self.rows.append(String(UITableViewCell))
        self.rows.append(String(Example2TableViewCell))
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let className = self.rows[indexPath.row] as! String
        let cell = tableView.dequeueReusableCellWithIdentifier(className, forIndexPath: indexPath)
        
        //Addtional configuration for the cell
        switch className {
        case String(Example1TableViewCell):
            
            break
        case String(UITableViewCell):
            cell.textLabel?.text = "A tottally native cell"
            break
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
}
