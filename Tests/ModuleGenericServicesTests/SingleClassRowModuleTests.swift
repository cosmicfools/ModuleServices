//
//  SingleClassRowModuleTests.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import XCTest
import ModuleServices
import ModuleGenericServices
import ModuleSnapshotServices
import UIKit

private class DummyCell: UITableViewCell, ConfigurableCell {
    var configured: Bool = false
    class Decorator: NSObject {}
    func configure(decorator: Decorator) { configured = true }
}

class SingleClassRowModuleTests: XCTestCase {
    let modulesHelperVC = ModulesHelperTestsViewController()
    
    func testRowCreated() {
        let tableView = UITableView(frame: .zero)
        let module = SingleClassRowModule<DummyCell, DummyCell.Decorator>(tableView: tableView)
        
        XCTAssert(module.rows.count == 1, "Generic module has not created properly the row")
    }
    
    func testConfigureCalled() {
        modulesHelperVC.modulesDelegate = self
        modulesHelperVC.adjustToFitScreen(orientation: .portrait)
        
        guard let cell = modulesHelperVC.tableView?.cellForRow(at: IndexPath(row: .zero, section: .zero)) as? DummyCell
            else { return XCTFail("The cell has not been initilizated") }
        XCTAssert(cell.configured, "The cell has not been configured")
    }
}

extension SingleClassRowModuleTests: ModulesHelperTestsViewControllerDelegate {
    func helperTestViewController(modulesHelperTest: ModulesHelperTestsViewController,
                                  tableView: UITableView) -> [TableSectionModule] {
        [SingleClassRowModule<DummyCell, DummyCell.Decorator>(tableView: tableView)]
    }
}
