//
//  TableSectionModuleTest.swift
//  FTMTableSectionModules
//
//  Created by Francisco Trujillo on 16/05/2016.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit
import XCTest
import ModulesKit

class TableSectionModuleTest: XCTestCase {
}

// MARK: - Fetching functions
extension TableSectionModuleTest {
    func testStartFetchDefault() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        XCTAssert(!module.isFetching, "The module shouldnt be fecthing by default")
    }
    
    func testStartFetchTrue() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        module.startFetch()
        
        XCTAssert(module.isFetching, "The module should be fecthing")
    }
    
    func testStartFetch() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        XCTAssert(!module.isFetching, "The module shouldn't be fecthing")
        
        module.startFetch()
        
        XCTAssert(module.isFetching, "The module should be fecthing")
    }
    
    func testStopFetchDefault() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        XCTAssert(!module.isFetching, "The module shouldnt be fecthing by default")
    }
    
    func testStopFetchTrue() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        module.startFetch()
        module.stopFetch()
        
        XCTAssert(!module.isFetching, "The module shouldnt be fecthing")
    }
    
    func testStopFetchFalse() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        module.startFetch()
        
        XCTAssert(module.isFetching, "The module should be fecthing")
    }
    
    func testStopFetch() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        module.startFetch()
        
        XCTAssert(module.isFetching, "The module should be fecthing")
        
        module.stopFetch()
        
        XCTAssert(!module.isFetching, "The module should be fecthing")
    }
    
    func testFetchCicle() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        XCTAssert(!module.isFetching, "The module shouldnt be fecthing by default")
        
        module.startFetch()
        
        XCTAssert(module.isFetching, "The module should be fecthing")
        
        module.stopFetch()
        
        XCTAssert(!module.isFetching, "The module should be fecthing")
    }
}

//MARK: - isPresented Functions
extension TableSectionModuleTest {
    func testDefaultPresentedValue() {
        let tableView : UITableView = UITableView()
        let module : TableSectionModule = TableSectionModule(tableView: tableView)
        
        XCTAssert(!module.isPresented, "The module shouldnt be presented by default")
    }
}

//MARK: - Registers Functions
extension TableSectionModuleTest {
    func testRegisterNotNilHeader() {
        let tableView : UITableView = UITableView()
        let module : TestModule1 = TestModule1(tableView: tableView)
        
        let header : UITableViewHeaderFooterView = module.tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: TestExample1HeaderFooterView.self))!
        
        XCTAssertNotNil(header, "The TestExample1HeaderFooterView should be dequeued")
    }
    
    func testRegisterNotNilCells() {
        let tableView : UITableView = UITableView()
        let module : TestModule1 = TestModule1(tableView: tableView)
        
        let cell : UITableViewCell = module.tableView.dequeueReusableCell(withIdentifier: String(describing: TestExample1TableViewCell.self))!
        
        XCTAssertNotNil(cell, "The TestExample1TableViewCell should be dequeued")
    }
    
    func testRegisterFullModule() {
        let tableView : UITableView = UITableView()
        let module : TestModule3 = TestModule3(tableView: tableView)
        var header : UITableViewHeaderFooterView
        var cell : UITableViewCell
        
        header = module.tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: TestExample1HeaderFooterView.self))!
        XCTAssertNotNil(header, "The TestExample1HeaderFooterView should be dequeued")
        
        header = module.tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: TestExample2HeaderFooterView.self))!
        XCTAssertNotNil(header, "The TestExample2HeaderFooterView should be dequeued")
        
        cell = module.tableView.dequeueReusableCell(withIdentifier: String(describing: TestExample1TableViewCell.self))!
        XCTAssertNotNil(cell, "The TestExample1TableViewCell should be dequeued")
        
        cell = module.tableView.dequeueReusableCell(withIdentifier: String(describing: TestExample2TableViewCell.self))!
        XCTAssertNotNil(cell, "The TestExample2TableViewCell should be dequeued")
        
    }
}
