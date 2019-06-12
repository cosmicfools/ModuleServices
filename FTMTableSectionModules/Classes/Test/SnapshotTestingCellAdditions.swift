//
//  SnapshotTestingCellAdditions.swift
//  Pods
//
//  Created by Francisco Javier Trujillo Mata on 13/06/2019.
//

import UIKit

public extension UITableViewCell {
    override func adjustToFitScreen(orientation: UIInterfaceOrientation) {
        contentView.adjustToFitScreen(orientation: orientation)
        
        var adjustedFrame = contentView.bounds
        
        //Add separator height
        let scale = SnapshotTestDeviceInfo().scale
        adjustedFrame.size.height += CGFloat(NSDecimalNumber.one.floatValue) / scale
        adjustedFrame.size.height = ceil(adjustedFrame.size.height)
        
        contentView.bounds = adjustedFrame
        bounds = contentView.bounds
    }
}
