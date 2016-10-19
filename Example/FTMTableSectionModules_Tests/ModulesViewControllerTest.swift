//
//  ModulesViewControllerTest.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 16/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import FTMTableSectionModules

class ModulesViewControllerTest: XCTestCase {
        
    func testModulesDataSourceEmpty() {
        let modulesVC : ModulesViewController = ModulesViewController()
        let newTableView : UITableView = UITableView()
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 0, "The number of section shoulb be 0")
    }
    
    func testModulesDataSource() {
        let modulesVC : ModulesViewController = ModulesViewController()
        let newTableView : UITableView = UITableView()
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 0, "The number of section shoulb be 0")
        
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 0")
    }
    
}
