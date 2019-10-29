//
//  HelloWorldModule.swift
//  FTMTableSectionModules_Example
//
//  Created by Francisco Javier Trujillo Mata on 03/12/2018.
//  Copyright © 2018 FJTRUJY. All rights reserved.
//

import FTMTableSectionModules

class HelloWorldModule: TableSectionModule {
    
    override func registerClassForCells() -> [AnyClass] {
        return super.registerClassForCells() + [
            UITableViewCell.classForCoder(),
        ]
    }
    
    override func createRows() {
        super.createRows()
        
        rows.append(String(describing: UITableViewCell.self))
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let identifier = rows[indexPath.row] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "Hello World from my first Module!"
        
        return cell
    }
}
