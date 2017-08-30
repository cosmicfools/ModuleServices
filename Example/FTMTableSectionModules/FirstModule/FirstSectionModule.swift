//
//  FirstSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 12/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import FTMTableSectionModules

class FirstSectionModule: TableSectionModule {
    override func registerNibsForCells() -> [AnyClass] {
        return super.registerNibsForCells() + [
            Example1TableViewCell.classForCoder(),
            Example2TableViewCell.classForCoder(),
            Example3TableViewCell.classForCoder(),
        ]
    }
    
    override func registerClassForCells() -> [AnyClass] {
        return super.registerClassForCells() + [UITableViewCell.classForCoder()]
    }
    
    override func createRows() {
        super.createRows()
        
        self.rows.append(String(describing: Example1TableViewCell.self) as AnyObject)
        self.rows.append(String(describing: UITableViewCell.self) as AnyObject)
        self.rows.append(String(describing: Example2TableViewCell.self) as AnyObject)
        self.rows.append(String(describing: Example3TableViewCell.self) as AnyObject)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let className = self.rows[(indexPath as NSIndexPath).row] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: className, for: indexPath)
        
        //Addtional configuration for the cell
        switch className {
        case String(describing: Example1TableViewCell.self):
            
            break
        case String(describing: UITableViewCell.self):
            cell.textLabel?.text = "A tottally native cell"
            break
        case String(describing: Example3TableViewCell.self):
            let example3cell = cell as! Example3TableViewCell
            example3cell.configureWithImage(UIImage.init(imageLiteralResourceName: "giveATry"))
            break
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        var height = super.tableView(tableView, heightForRowAtIndexPath: indexPath);
        
        let className = self.rows[(indexPath as NSIndexPath).row] as! String
        switch className {
        case String(describing: Example3TableViewCell.self):
            height = UITableViewAutomaticDimension
            break
        default:
            height = 44.0
            break
        }
        
        return height
    }
}
