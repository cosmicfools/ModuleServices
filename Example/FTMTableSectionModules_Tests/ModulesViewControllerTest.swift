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
    
    func testFirstModule() {
        let module0 = TestModule2(tableView: newTableView)
        let module1 = TestModule1(tableView: newTableView)
        let module2 = TestModule2(tableView: newTableView)
        let module3 = TestModule1(tableView: newTableView)
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        let firstModule1: TestModule1? = modulesVC.firstModule()
        let firstModule2: TestModule2? = modulesVC.firstModule()
        
        XCTAssert(module1 == firstModule1, "The first module filter is not working properly")
        XCTAssert(module0 == firstModule2, "The first module filter is not working properly")
    }
    
    func testLastModule() {
        let module0 = TestModule2(tableView: newTableView)
        let module1 = TestModule1(tableView: newTableView)
        let module2 = TestModule2(tableView: newTableView)
        let module3 = TestModule1(tableView: newTableView)
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        let lastModule1: TestModule1? = modulesVC.lastModule()
        let lastModule2: TestModule2? = modulesVC.lastModule()
        
        XCTAssert(module3 == lastModule1, "The last module filter is not working properly")
        XCTAssert(module2 == lastModule2, "The last module filter is not working properly")
    }
    
    func testFilterModule() {
        let module0 = TestModule2(tableView: newTableView)
        let module1 = TestModule1(tableView: newTableView)
        let module2 = TestModule2(tableView: newTableView)
        let module3 = TestModule1(tableView: newTableView)
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        let filterModules1: [TestModule1]? = modulesVC.filterModules()
        
        XCTAssert(filterModules1?.count == 2, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.first == module1, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.last == module3, "The filter modules function is not working properly")
    }
    
}
