//
//  ModulesViewControllerTest.swift
//  ModuleServices
//
//  Created by Francisco Javier Trujillo Mata on 16/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import XCTest
import ModuleServices

class ModulesViewControllerTest: XCTestCase {
    let modulesVC : ModulesViewController = ModulesViewController()
    let newTableView : UITableView = UITableView()
    
    func testModulesDataSourceEmpty() {
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 0, "The number of section shoulb be 0")
    }
    
    func testAppendModule() {
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 1, "The number of section shoulb be 1")
    }
    
    func testInsertModuleAtFirstIndex() {
        modulesVC.insertModule(TestModule1(tableView: newTableView), atIndex: 0)

        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 1, "The number of section shoulb be 0")
    }
    
    func testInsertModuleAtIndexWithMoreElements() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(lastModule)
        modulesVC.insertModule(firstModule, atIndex: 0)
        
        XCTAssert(modulesVC.sectionForModule(firstModule) == 0, "The firstModule should be the first in the array")
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 2, "The number of section shoulb be 0")
    }
    
    
    func testRemoveAllModules() {
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        modulesVC.appendModule(TestModule1(tableView: newTableView))
        
        modulesVC.removeAllModules()
        
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 0, "The number of section shoulb be 0")
    }
    
    func testRemoveModuleAtIndex() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeModuleAtIndex(0)
        
        XCTAssert(modulesVC.sectionForModule(firstModule) == NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 1, "The number of section shoulb be 1")
    }
    
    func testRemoveFirstModule() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeFirstModule()
        
        XCTAssert(modulesVC.sectionForModule(firstModule) == NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 1, "The number of section shoulb be 1")
    }
    
    func testRemoveLastModule() {
        let firstModule = TestModule1(tableView: newTableView)
        let lastModule = TestModule1(tableView: newTableView)
        modulesVC.appendModule(firstModule)
        modulesVC.appendModule(lastModule)
        
        modulesVC.removeLastModule()
        
        XCTAssert(modulesVC.sectionForModule(lastModule) == NSNotFound, "The firstModule shouldbn't in the modules array")
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 1, "The number of section shoulb be 1")
    }
    
    func testRemoveModule() {
        let module = TestModule1(tableView: newTableView)
        modulesVC.appendModule(module)
        modulesVC.removeModule(module)
        
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 0, "The number of section shoulb be 0")
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
        XCTAssert(modulesVC.sectionForModule(secondModule) == NSNotFound, "The second shouldbn't in the modules array")
        XCTAssert(modulesVC.sectionForModule(newSecondModule) == index, "The newSecondModule should be in the second position")
        XCTAssert(modulesVC.numberOfSections(in: newTableView) == 3, "The number of section shoulb be 3")
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
        let firstModule3: TestModule3? = modulesVC.firstModule()
        
        XCTAssert(module1 == firstModule1, "The first module filter is not working properly")
        XCTAssert(module0 == firstModule2, "The first module filter is not working properly")
        XCTAssertNil(firstModule3, "The first module filter is not working properly, it doesn't contains TestModule3")
    }
    
    func testFirstModuleCondition() {
        let module0 = TestModule1(tableView: newTableView)
        let module1 = TestBooleanModule(tableView: newTableView)
        let module2 = TestModule1(tableView: newTableView)
        let module3 = TestBooleanModule(tableView: newTableView)
        
        module3.fold = true
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        
        let foldModule: TestBooleanModule? = modulesVC.firstModule { $0.fold }
         XCTAssert(module3 == foldModule, "The first where filter is not working properly")
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
        let lastModule3: TestModule3? = modulesVC.firstModule()
        
        XCTAssert(module3 == lastModule1, "The last module filter is not working properly")
        XCTAssert(module2 == lastModule2, "The last module filter is not working properly")
        XCTAssertNil(lastModule3, "The last module filter is not working properly, it doesn't contains TestModule3")
    }
    
    func testLastModuleCondition() {
        let module0 = TestModule1(tableView: newTableView)
        let module1 = TestBooleanModule(tableView: newTableView)
        let module2 = TestModule1(tableView: newTableView)
        let module3 = TestBooleanModule(tableView: newTableView)
        
        module1.fold = true
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        
        let foldModule: TestBooleanModule? = modulesVC.lastModule { $0.fold }
         XCTAssert(module1 == foldModule, "The last where filter is not working properly")
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
        let filterModules3: [TestModule3]? = modulesVC.filterModules()
        
        XCTAssert(filterModules1?.count == 2, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.first == module1, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.last == module3, "The filter modules function is not working properly")
        XCTAssert(filterModules3?.count == 0, "The filter modules is not working properly, it doesn't contains TestModule3")
    }
    
    func testFilterModuleCondition() {
        let module0 = TestModule1(tableView: newTableView)
        let module1 = TestBooleanModule(tableView: newTableView)
        let module2 = TestModule1(tableView: newTableView)
        let module3 = TestBooleanModule(tableView: newTableView)
        
        module1.fold = true
        
        modulesVC.appendModule(module0)
        modulesVC.appendModule(module1)
        modulesVC.appendModule(module2)
        modulesVC.appendModule(module3)
        
        let filterModules1: [TestModule1]? = modulesVC.filterModules()
        let filterBooleanModules: [TestBooleanModule]? = modulesVC.filterModules { $0.fold }
        
        XCTAssert(filterModules1?.count == 2, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.first == module0, "The filter modules function is not working properly")
        XCTAssert(filterModules1?.last == module2, "The filter modules function is not working properly")
        XCTAssert(filterBooleanModules?.count == 1, "The filter modules is not working properly, it doesn't contains TestModule3")
        XCTAssert(filterBooleanModules?.last == module1, "The filter modules function is not working properly")
    }
    
}
