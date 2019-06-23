//
//  SnapshotGenerator.swift
//  Pods
//
//  Created by Francisco Javier Trujillo Mata on 20/06/2019.
//

import CombinationGenerator

open class SnapshotGenerator: Generator {

    public override init(baseClass: NSObject.Type) {
        super.init(baseClass: baseClass)
        
        addCombination(propertyKey: "orientation", values: [UIInterfaceOrientation.portrait, UIInterfaceOrientation.landscapeLeft])
    }
}
