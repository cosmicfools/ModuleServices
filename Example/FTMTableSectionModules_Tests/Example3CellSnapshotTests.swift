//
//  Example3CellSnapshotTests.swift
//  FTMTableSectionModules_Tests
//
//  Created by Francisco Javier Trujillo Mata on 13/06/2019.
//  Copyright © 2019 FJTRUJY. All rights reserved.
//

import FBSnapshotTestCase
import FTMTableSectionModules

@testable import FTMTableSectionModules_Example

class Example3CellSnapshotTests: FBSnapshotTestCase {
    var cell : Example3TableViewCell?
    
    override func setUp() {
        super.setUp()
        
        recordMode = false
        
        cell = (Bundle.main.loadNibNamed(String(describing: Example3TableViewCell.self), owner: nil, options: nil)?.first as! Example3TableViewCell)
        cell?.configureWithImage(UIImage.init(imageLiteralResourceName: "giveATry"))
    }

    func testPortraitLayout() {
        cell?.adjustToFitScreen(orientation: .portrait)
        FBSnapshotVerifyView(cell!)
    }
    
    func testLandscapeLayout() {
        cell?.adjustToFitScreen(orientation: .landscapeLeft)
        FBSnapshotVerifyView(cell!)
    }

}
