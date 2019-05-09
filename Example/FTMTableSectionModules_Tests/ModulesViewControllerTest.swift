//
//  ModulesViewControllerTest.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 16/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import XCTest
import FTMTableSectionModules

class ModulesViewControllerTest: XCTestCase {
    let modulesVC : ModulesViewController = ModulesViewController()
    let newTableView : UITableView = UITableView()
    
    func testModulesDataSourceEmpty() {
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 0, "The number of section shoulb be 0")
    }
    
    func testAppendModule() {
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 1")
    }
    
    func testInsertModuleAtFirstIndex() {
        modulesVC.insertModule(TestModule1(tableView: newTableView), atIndex: 0)

        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 0")
    }
    
    func testInsertModuleAtIndexWithMoreElements() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(lastModule)
        modulesVC.insertModule(firstModule, atIndex: 0)
        
        XCTAssertEqual(modulesVC.sectionForModule(firstModule), 0, "The firstModule should be the first in the array")
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 2, "The number of section shoulb be 0")
    }
    
    
    func testRemoveAllModules() {
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        
        modulesVC.removeAllModules()
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 0, "The number of section shoulb be 0")
    }
    
    func testRemoveModuleAtIndex() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeModuleAtIndex(0)
        
        XCTAssertEqual(modulesVC.sectionForModule(firstModule), NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 1")
    }
    
    func testRemoveFirstModule() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeFirstModule()
        
        XCTAssertEqual(modulesVC.sectionForModule(firstModule), NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 1")
    }
    
    func testRemoveLastModule() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeLastModule()
        
        XCTAssertEqual(modulesVC.sectionForModule(lastModule), NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 1, "The number of section shoulb be 1")
    }
    
    func testRemoveModule() {
        let module = TestModule1(tableView: newTableView)
        modulesVC.appendModule(module)
        modulesVC.removeModule(module)
        
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 0, "The number of section shoulb be 0")
    }
    
    func testReplaceModule() {
        let firstModule = TestModule1(tableView: newTableView)
        let secondModule = TestModule1(tableView: newTableView)
        let newSecondModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(secondModule)
        modulesVC.appendModule(lastModule)
        
        let index = modulesVC.sectionForModule(secondModule)
        
        modulesVC.replaceModuleAtSection(index, withModule: newSecondModule)
        XCTAssertEqual(modulesVC.sectionForModule(secondModule), NSNotFound, "The second shouldbn't in the modules array")
        XCTAssertEqual(modulesVC.sectionForModule(newSecondModule), index, "The newSecondModule should be in the second position")
        XCTAssertEqual(modulesVC.numberOfSections(in: newTableView), 3, "The number of section shoulb be 3")
    }
    
}
