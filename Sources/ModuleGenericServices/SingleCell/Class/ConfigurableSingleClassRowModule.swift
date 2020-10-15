//
//  ConfigurableSingleClassRowModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class ConfigurableSingleClassRowModule<Cell: ConfigurableCell, Decorator: NSObject>:
    SingleClassRowBaseModule<Cell, Decorator> {
    
    var decorator: Decorator?
    
    open override func createRows() {
        super.createRows()
        guard let decorator = decorator else { return }
        rows += [decorator]
    }
    
    open func configure(decorator: Decorator) {
        self.decorator = decorator
        
        createRows()
    }
    
    open  func refreshCell() {
        guard let cell = tableView.cellForRow(at: IndexPath(row: .zero, section: section)) as? Cell,
            let decorator = decorator as? Cell.Decorator else { return }
        cell.configure(decorator: decorator)
    }
}
