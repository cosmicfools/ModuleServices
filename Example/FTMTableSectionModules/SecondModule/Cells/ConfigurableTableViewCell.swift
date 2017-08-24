//
//  ConfigurableTableViewCell.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 24/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class ConfigurableTableViewCell: UITableViewCell {
    @IBOutlet weak private var label : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configureWithAttributedString(_ attributedString: NSAttributedString) {
        self.label.attributedText = attributedString
    }
    
}
