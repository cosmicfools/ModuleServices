//
//  ModulesViewAdditions.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 09/05/2019.
//

import UIKit

extension UIView {
    
    func fitSubView(view: UIView) {
        let zeroPadding = UIEdgeInsets.zero
        fitSubView(view: view,
                   leading: zeroPadding.left,
                   top: zeroPadding.top,
                   traling: zeroPadding.right,
                   bottom: zeroPadding.bottom)
    }
    
    func fitSubView(view: UIView, leading: CGFloat, top: CGFloat, traling: CGFloat, bottom: CGFloat ) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let multiplier = CGFloat(truncating: NSDecimalNumber.one)
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: NSLayoutConstraint.Attribute.top,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.top,
                                         multiplier: multiplier,
                                         constant: top))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.bottom,
                                         multiplier: multiplier,
                                         constant: bottom))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: NSLayoutConstraint.Attribute.leading,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.leading,
                                         multiplier: multiplier,
                                         constant: leading))
        addConstraint(NSLayoutConstraint(item: view,
                                         attribute: NSLayoutConstraint.Attribute.trailing,
                                         relatedBy: NSLayoutConstraint.Relation.equal,
                                         toItem: self,
                                         attribute: NSLayoutConstraint.Attribute.trailing,
                                         multiplier: multiplier,
                                         constant: traling))
    }
}
