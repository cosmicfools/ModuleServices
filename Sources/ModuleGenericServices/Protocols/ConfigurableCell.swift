//
//  ConfigurableCell.swift
//  
//
//  Created by Francisco Javier Trujillo Mata on 15/10/2020.
//

import UIKit

public protocol ConfigurableCell: UITableViewCell {
    associatedtype Decorator
    func configure(decorator: Decorator)
}

