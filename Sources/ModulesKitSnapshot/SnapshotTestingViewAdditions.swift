//
//  SnapshotTestingViewAdditions.swift
//  ModulesKit
//
//  Created by Francisco Javier Trujillo Mata on 13/06/2019.
//

import UIKit

public extension UIView {
    @objc func adjustToFitScreen(orientation: UIInterfaceOrientation) {
        let deviceSize = SnapshotTestDeviceInfo().deviceSize
        let width = orientation.isPortrait ? deviceSize.width : deviceSize.height
        bounds = CGRect(origin: CGPoint.zero,
                        size: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude - 1))

        setNeedsLayout()
        layoutIfNeeded()

        var adjustedFrame = bounds
        adjustedFrame.size = systemLayoutSizeFitting(adjustedFrame.size,
                                                     withHorizontalFittingPriority: .required,
                                                     verticalFittingPriority: .fittingSizeLevel)
        adjustedFrame.size.height = ceil(adjustedFrame.size.height)

        bounds = adjustedFrame
    }
}
