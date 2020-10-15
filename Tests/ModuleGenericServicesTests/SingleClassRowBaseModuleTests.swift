//
//  SingleClassRowBaseModuleTests.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import XCTest
import ModuleGenericServices
import UIKit

private class DummyCell: UITableViewCell, ConfigurableCell {
    class Decorator: NSObject {}
    func configure(decorator: Decorator) {}
}

class SingleClassRowBaseModuleTests: XCTestCase {
    
    func testCreateModule() {
        let tableView = UITableView(frame: .zero)
        let module = SingleClassRowBaseModule<DummyCell, DummyCell.Decorator>(tableView: tableView)
        
        XCTAssertNotNil(module, "Generic module has not been properly created")
    }
}
