//
//  RowsDecoratorProtocol.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import Foundation

public protocol RowsDecoratorProtocol {
    associatedtype RowElement
    
    var rows: [RowElement] { get set }
    init()
}
