//
//  SnapshotObject.swift
//  CombinationGenerator
//
//  Created by Francisco Javier Trujillo Mata on 20/06/2019.
//

import UIKit

open class SnapshotObject: NSObject {
    open var orientation: UIInterfaceOrientation?
    
    open func snapshotIdentifier() -> String {
        var identififer: String = String(describing: self)
        let mirror = Mirror(reflecting: self)
        
        for child in mirror.children {
            identififer += (child.label! + (child.value as! String))
        }
        
        return identififer
    }
}
