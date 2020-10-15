//
//  SingleNibRowModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SingleNibRowModule<Cell: ConfigurableCell, Decorator: NSObject>: SingleNibRowBaseModule<Cell, Decorator> {
    open override func createRows() {
        super.createRows()
        
        rows += [Decorator()]
    }
}
