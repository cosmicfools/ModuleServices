//
//  ModulesViewAdditions.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 09/05/2019.
//

import UIKit

public extension UIView {
    
    func fitSubView(view: UIView) {
        fitSubView(view: view,
                   leading: .zero,
                   top: .zero,
                   traling: .zero,
                   bottom: .zero)
    }
    
    func fitSubView(view: UIView, leading: CGFloat, top: CGFloat, traling: CGFloat, bottom: CGFloat ) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let multiplier = CGFloat(truncating: NSDecimalNumber.one)
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .top,
                                         multiplier: multiplier,
                                         constant: top))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: .bottom,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .bottom,
                                         multiplier: multiplier,
                                         constant: bottom))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .leading,
                                         multiplier: multiplier,
                                         constant: leading))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: .trailing,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .trailing,
                                         multiplier: multiplier,
                                         constant: traling))
    }
}
