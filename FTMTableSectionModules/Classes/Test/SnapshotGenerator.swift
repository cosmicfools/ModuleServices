//
//  SnapshotGenerator.swift
//  Pods
//
//  Created by Francisco Javier Trujillo Mata on 20/06/2019.
//

import CombinationGenerator

class SnapshotGenerator: Generator {

    override init(baseClass: NSObject.Type) {
        super.init(baseClass: baseClass)
        
        addCombination(propertyKey: "orientation", values: [UIDeviceOrientation.portrait, UIDeviceOrientation.landscapeLeft])
    }
}
