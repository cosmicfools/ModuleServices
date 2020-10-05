//
//  SnapshotGenerator.swift
//  Pods
//
//  Created by Francisco Javier Trujillo Mata on 20/06/2019.
//

import CombinationGenerator
import UIKit

open class SnapshotGenerator<T: Any>: Generator<T> {

    public override init() {
        super.init()
        
        addCombination(propertyKey: "orientation", values: [UIInterfaceOrientation.portrait, UIInterfaceOrientation.landscapeLeft])
    }
}
