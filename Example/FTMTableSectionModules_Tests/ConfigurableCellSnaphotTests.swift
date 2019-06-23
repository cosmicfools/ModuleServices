//
//  ConfigurableCellSnaphotTests.swift
//  FTMTableSectionModules_Tests
//
//  Created by Francisco Javier Trujillo Mata on 21/06/2019.
//  Copyright © 2019 FJTRUJY. All rights reserved.
//

import FBSnapshotTestCase
import FTMTableSectionModules

@testable import FTMTableSectionModules_Example

fileprivate var combinations: [ConfigurableSnapshotModel]?

func prepareGenerator() {
    let generator = SnapshotGenerator(baseClass: ConfigurableSnapshotModel.self)
    
    let texts = [
        "Lorem fistrum condemor papaar papaar torpedo mamaar pecador.",
        "Pupita al ataquerl a wan quietooor.",
        "Pupita sexuarl fistro condemor papaar papaar benemeritaar se calle ustée a peich.",
        "Está la cosa muy malar se calle ustée ahorarr diodeno benemeritaar hasta luego Lucas jarl diodeno caballo blanco caballo negroorl fistro tiene musho peligroo.",
    ]
    
    let boldAttributes: [NSAttributedString.Key : Any] = [
        .font : UIFont.boldSystemFont(ofSize:15),
        .foregroundColor : UIColor.blue,
    ]
    
    let italianAttributes: [NSAttributedString.Key : Any] = [
        .font : UIFont.italicSystemFont(ofSize:12),
        .foregroundColor : UIColor.gray,
    ]
    
    
    generator.addCombination(propertyKey: "text", values: texts)
    generator.addCombination(propertyKey: "attributes", values: [italianAttributes, boldAttributes])
    
    combinations = generator.generateCombinations() as? [ConfigurableSnapshotModel]
}


class ConfigurableCellSnaphotTests: FBSnapshotTestCase {
    var cell: ConfigurableTableViewCell?
    var model: ConfigurableSnapshotModel?
    var identifier: String?
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
    
        cell = (Bundle.main.loadNibNamed(String(describing: ConfigurableTableViewCell.self), owner: nil, options: nil)?.first as! ConfigurableTableViewCell)
    }

    @objc func verifyView() {
        cell?.configureWithAttributedString(((model?.attrText())!))
        cell?.adjustToFitScreen(orientation: model!.orientation!)
        
        FBSnapshotVerifyView(cell!, identifier: identifier!)
    }
    
    override class var defaultTestSuite: XCTestSuite {
        let suite = XCTestSuite(forTestCaseClass: ConfigurableCellSnaphotTests.self)
        
        prepareGenerator()
        
        combinations?.forEach { configurableSnapshotModel in
            
            // Generate a test for our specific selector
            let snapshotTest = ConfigurableCellSnaphotTests(selector: #selector(verifyView))
            let stringIndex: String = combinations!.firstIndex(of: configurableSnapshotModel)?.description ?? ""
            
            snapshotTest.model = configurableSnapshotModel
            snapshotTest.identifier = stringIndex
            
            suite.addTest(snapshotTest)
        }
        
        return suite
    }

}
