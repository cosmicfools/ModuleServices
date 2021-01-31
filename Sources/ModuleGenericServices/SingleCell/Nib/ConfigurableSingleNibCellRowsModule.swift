//
//  ConfigurableSingleNibCellRowsModule.swift
//  
//
//  Created by Francisco Navarro on 31/01/2021.
//

import UIKit
import ModuleServices

open class ConfigurableSingleNibCellRowsModule<Cell: ConfigurableCell, Decorator: RowsDecoratorProtocol>: SingleNibCellRowsModule<Cell, Decorator> {
    
    func configure(decorator: Decorator) {
        rows = decorator.rows
    }
}
