//
//  Example3TableViewCell.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 30/08/2017.
//  Copyright © 2017 FJTRUJY. All rights reserved.
//

import UIKit

class Example3TableViewCell: UITableViewCell {
    @IBOutlet weak private var myImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    open func configureWithImage(_ image: UIImage) {
        self.myImageView.image = image
    }
    
}
