//
//  ModulesHelperTestsViewControllerTests.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 07/10/2020.
//

import XCTest
import UIKit
import ModuleServices
import ModuleSnapshotServices

private enum Constants {
    static let expectationDuration: TimeInterval = 0.1
}

class ModulesHelperTestsViewControllerTests: XCTestCase {
    let modulesHelperVC = ModulesHelperTestsViewController()
    var expect: XCTestExpectation?
    
    func testDelegateCalled() {
        let expect = expectation(description: "Delegate create moduled didn't called")
        modulesHelperVC.modulesDelegate = self
        
        self.expect = expect
        modulesHelperVC.adjustToFitScreen(orientation: .portrait)
        wait(for: [expect], timeout: Constants.expectationDuration)
    }
    
    func testFrameAfterAdjust() {
        modulesHelperVC.adjustToFitScreen(orientation: .portrait)
        XCTAssert(modulesHelperVC.view.frame != .zero, "The size of the HelperVC didn't change")
    }
}

extension ModulesHelperTestsViewControllerTests: ModulesHelperTestsViewControllerDelegate {
    func helperTestViewController(modulesHelperTest: ModulesHelperTestsViewController,
                                  tableView: UITableView) -> [TableSectionModule] {
        expect?.fulfill()
        return []
    }
}
