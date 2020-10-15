//
//  SelectableSingleClassRowModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SelectableSingleClassRowModule<Cell: ConfigurableCell, Decorator: RowSelectableProtocol>:
    ConfigurableSingleNibRowModule<Cell, Decorator> {
    open weak var delegate: SelectableSingleClassRowModuleDelegate?
    
    open override func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let element = decorator?.element else { return }
        delegate?.selectableSingleClassRowModule(self, didSelectElement: element)
    }
}

// MARK: - SelectableSingleClassRowModuleDelegate
public protocol SelectableSingleClassRowModuleDelegate: class {
    func selectableSingleClassRowModule<Cell: ConfigurableCell, Decorator: RowSelectableProtocol>
            (_ module: SelectableSingleClassRowModule<Cell, Decorator>, didSelectElement element: Any)
}
