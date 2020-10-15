//
//  SingleClassRowModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

open class SingleClassRowModule<Cell: ConfigurableCell, Decorator: NSObject>: SingleClassRowBaseModule<Cell, Decorator> {
    open override func createRows() {
        super.createRows()
        
        rows += [Decorator()]
    }
}
