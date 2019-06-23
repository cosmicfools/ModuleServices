//
//  ConfigurableTableViewCell.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 24/08/2017.
//  Copyright © 2017 FJTRUJY. All rights reserved.
//

import UIKit

class ConfigurableTableViewCell: UITableViewCell {
    @IBOutlet weak private var label : UILabel!
    
    open func configureWithAttributedString(_ attributedString: NSAttributedString) {
        label.attributedText = attributedString
        backgroundColor = .white
    }
    
}
