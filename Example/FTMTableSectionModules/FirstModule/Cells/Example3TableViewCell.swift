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
    
    open func configureWithImage(_ image: UIImage) {
        myImageView.image = image
    }
    
}
