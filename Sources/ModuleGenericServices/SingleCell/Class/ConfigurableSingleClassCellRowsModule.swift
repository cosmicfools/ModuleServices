//
//  ConfigurableSingleClassCellRowsModule.swift
//  
//
//  Created by Francisco Navarro on 31/01/2021.
//

import UIKit
import ModuleServices

open class ConfigurableSingleClassCellRowsModule<Cell: ConfigurableCell, Decorator: RowsDecoratorProtocol>: SingleClassCellRowsModule<Cell, Decorator> {
    
    func configure(decorator: Decorator) {
        rows = decorator.rows
    }
}
