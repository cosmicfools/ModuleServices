//
//  TableSectionModuleTest.swift
//  FTMTableSectionModules
//
//  Created by Francisco Trujillo on 16/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import FTMTableSectionModules

class TableSectionModuleTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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

//MARK: - isPresented Functions
extension TableSectionModuleTest {
    func testRegisterNotNilCells() {
        let tableView : UITableView = UITableView()
        let module : TestModule1 = TestModule1(tableView: tableView)
        
        let cell : UITableViewCell = module.tableView.dequeueReusableCellWithIdentifier(String(TestExample1TableViewCell))!
        
        XCTAssertNotNil(cell, "The TestExample1TableViewCell should be dequeued")
    }
}
