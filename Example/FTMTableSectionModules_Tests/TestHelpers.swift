//
//  TestHelpers.swift
//  FTMTableSectionModules
//
//  Created by Francisco Trujillo on 16/05/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import XCTest
import FTMTableSectionModules

// MARK: - UITableViewCell subclass
class TestExample1TableViewCell:UITableViewCell {
}

// MARK: - UITableViewCell subclass
class TestExample2TableViewCell:UITableViewCell {
}

// MARK: - UITableViewHeaderFooterView subclass
class TestExample1HeaderFooterView : UITableViewHeaderFooterView {
}

// MARK: - UITableViewHeaderFooterView subclass
class TestExample2HeaderFooterView : UITableViewHeaderFooterView {
}

// MARK: - TableSectionModule subclass
class TestModule1 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] {
        return [TestExample1TableViewCell.classForCoder()]
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        return [TestExample1HeaderFooterView.classForCoder()]
    }
    
}

// MARK: - TableSectionModule subclass
class TestModule2 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] {
        return [TestExample2TableViewCell.classForCoder()]
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        return [TestExample2HeaderFooterView.classForCoder()]
    }
}

// MARK: - TableSectionModule subclass
class TestModule3 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] {
        return [TestExample1TableViewCell.classForCoder(),
                TestExample2TableViewCell.classForCoder()]
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        return [TestExample1HeaderFooterView.classForCoder(),
                TestExample2HeaderFooterView.classForCoder()]
    }
}

class TestHelpers: XCTestCase {

    
    
}
