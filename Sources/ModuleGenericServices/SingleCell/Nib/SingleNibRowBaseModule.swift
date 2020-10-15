//
//  SingleNibRowBaseModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SingleNibRowBaseModule<Cell: ConfigurableCell, Decorator: NSObject>: SingleRowBaseModule<Cell, Decorator> {
    open override func registerNibsForCells() -> [AnyClass] {
        super.registerNibsForCells() + [
            Cell.classForCoder()
        ]
    }
}
