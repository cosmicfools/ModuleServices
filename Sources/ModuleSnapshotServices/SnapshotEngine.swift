//
//  SnapshotEngine.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 08/02/2021.
//

import Foundation

public protocol SnapshotEngine: NSObject {
    associatedtype ModelGenerated: SnapshotObject
    var combinations: [ModelGenerated] { get }
}
