//
//  SnapshotTestDeviceInfo.swift
//  Pods
//
//  Created by Francisco Javier Trujillo Mata on 13/06/2019.
//

import UIKit

private struct Constants {
    static let deviceSize = CGSize(width: 750, height: 1334)
    static let scale: CGFloat  = 2.0
}

open class SnapshotTestDeviceInfo: NSObject {
    let deviceSize : CGSize = CGSize(width: Constants.deviceSize.width/Constants.scale,
                                     height:Constants.deviceSize.height/Constants.scale)
    let scale : CGFloat = Constants.scale
}
