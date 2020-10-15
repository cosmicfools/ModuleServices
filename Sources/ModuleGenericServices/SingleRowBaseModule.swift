//
//  SingleRowBaseModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

public class SingleRowBaseModule<Cell: ConfigurableCell, Decorator: NSObject>: TableSectionModule {
    
    public override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath)
        
        guard let decorator = rows[indexPath.row] as? Cell.Decorator, let myCell = cell as? Cell else { return cell }
        configureDelegateCell(myCell)
        myCell.configure(decorator: decorator)
        
        return myCell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func configureDelegateCell(_ cell: Cell) {}
}
