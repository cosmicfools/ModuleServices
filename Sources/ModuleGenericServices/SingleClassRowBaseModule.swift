//
//  SingleClassRowBaseModule.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit
import ModuleServices

public class SingleClassRowBaseModule<Cell: ConfigurableCell, Decorator: NSObject>: SingleRowBaseModule<Cell, Decorator> {
    public override func registerClassForCells() -> [AnyClass] {
        super.registerClassForCells() + [
            Cell.classForCoder()
        ]
    }
}
