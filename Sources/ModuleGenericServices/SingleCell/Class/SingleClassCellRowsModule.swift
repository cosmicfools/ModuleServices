//
//  SingleClassCellRowsModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SingleClassCellRowsModule<Cell: ConfigurableCell, RowsDecorator: RowsDecoratorProtocol>: TableSectionModule {
    open override func registerNibsForCells() -> [AnyClass] {
        super.registerNibsForCells() + [
            Cell.classForCoder()
        ]
    }
    
    open override func createRows() {
        super.createRows()
        
        rows += RowsDecorator().rows
    }
    
    open override func tableView(_ tableView: UITableView,
                                   cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath)
        
        guard let decorator = rows[indexPath.row] as? Cell.Decorator, let myCell = cell as? Cell else { return cell }
        configureDelegateCell(myCell)
        myCell.configure(decorator: decorator)
        
        return myCell
    }
    
    open override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    open func configureDelegateCell(_ cell: Cell) {}
}
