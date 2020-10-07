//
//  TestHelpers.swift
//  ModulesKit
//
//  Created by Francisco Trujillo on 16/05/2016.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit
import XCTest
import ModulesKit

// MARK: - UITableViewCell subclass
class TestExample1TableViewCell:UITableViewCell {}

// MARK: - UITableViewCell subclass
class TestExample2TableViewCell:UITableViewCell {}

// MARK: - UITableViewHeaderFooterView subclass
class TestExample1HeaderFooterView : UITableViewHeaderFooterView {}

// MARK: - UITableViewHeaderFooterView subclass
class TestExample2HeaderFooterView : UITableViewHeaderFooterView {}

// MARK: - TableSectionModule subclass
class TestModule1 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] { [TestExample1TableViewCell.classForCoder()] }
    override func registerClassForHeadersFooters() -> [AnyClass] { [TestExample1HeaderFooterView.classForCoder()] }
}

// MARK: - TableSectionModule subclass
class TestModule2 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] { [TestExample2TableViewCell.classForCoder()] }
    override func registerClassForHeadersFooters() -> [AnyClass] { [TestExample2HeaderFooterView.classForCoder()] }
}

// MARK: - TableSectionModule subclass
class TestModule3 : TableSectionModule {
    override func registerClassForCells() -> [AnyClass] {
        [TestExample1TableViewCell.classForCoder(), TestExample2TableViewCell.classForCoder()]
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        [TestExample1HeaderFooterView.classForCoder(), TestExample2HeaderFooterView.classForCoder()]
    }
}

// MARK: - TableSectionModule subclass
class TestBooleanModule : TableSectionModule {
    var fold: Bool = false
    override func registerClassForCells() -> [AnyClass] {
        [TestExample1TableViewCell.classForCoder(), TestExample2TableViewCell.classForCoder()]
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        [TestExample1HeaderFooterView.classForCoder(), TestExample2HeaderFooterView.classForCoder()]
    }
}
