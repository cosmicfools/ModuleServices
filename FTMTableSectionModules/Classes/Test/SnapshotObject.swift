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
            let identifierMethod = child.label! + "Identifier"
            let aSel : Selector = NSSelectorFromString(identifierMethod)
            var value: String = ""
            
            if self.responds(to: aSel) {
                value = self.perform(aSel)?.takeRetainedValue() as! String
            } else {
                value = child.value as! String
            }
            
            identififer += (child.label! + value)
        }
        
        return identififer
    }
}
