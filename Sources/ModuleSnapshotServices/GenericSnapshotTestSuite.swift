//
//  GenericSnapshotTestSuite.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 08/02/2021.
//

import XCTest

open class GenericSnapshotTestSuite<View: UIView, Engine: SnapshotEngine>: XCTestCase {
    let view = (Bundle.main.loadNibNamed(String(describing: View.self), owner: nil, options: nil)?.first as! View)
    var model: Engine.ModelGenerated?
    var identifier: String?
    
    required convenience public init(snashotSelector: Selector) {
        self.init(selector: snashotSelector)
    }
        
    open override class var defaultTestSuite: XCTestSuite {
        let combinations = Engine().combinations
        return combinations.reduce(into: XCTestSuite(forTestCaseClass: self<View, Engine>.self)) {
            // Generate a test for our specific selector
            let snapshotTest = self.init(snashotSelector: #selector(verifyView))
            
            snapshotTest.model = $1
            snapshotTest.identifier = combinations.firstIndex(of: $1)?.description

            $0.addTest(snapshotTest)
        }
    }
    
    @objc func verifyView() {
        guard let model = model, let identifier = identifier
        else { return XCTFail("GenericSnapshotTestSuite The model or identifier for the snapshot were not set") }
        
        executeTestForView(view, model: model, identifier: identifier)
    }
    
    open func executeTestForView(_ view: View, model: Engine.ModelGenerated, identifier: String) {
        fatalError("executeTestForView must be implemented by subclasses, if you did DON'T call super")
    }
}
