//
//  ConfigurableSnapshotModel.swift
//  FTMTableSectionModules_Tests
//
//  Created by Francisco Javier Trujillo Mata on 21/06/2019.
//  Copyright © 2019 FJTRUJY. All rights reserved.
//

import UIKit
import FTMTableSectionModules

class ConfigurableSnapshotModel: SnapshotObject {
    var text: String?
    var attributes: [NSAttributedString.Key: Any]?
    
    func attrText() -> NSAttributedString {
        return NSAttributedString.init(string: text!, attributes: attributes)
    }
    
    @objc func attributesIdentifier() -> String {
        return (attributes?.values.reduce("") {text, attrValue in "\(String(describing: text)),\(attrValue)"})!
    }
}
