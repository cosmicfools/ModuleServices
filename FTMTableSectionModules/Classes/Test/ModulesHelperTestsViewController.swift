//
//  ModulesHelperTestsViewController.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit

private struct Constants {
    static let estimatedRowHeight: CGFloat = 44.0
}

open class ModulesHelperTestsViewController: ModulesViewController {
    public weak var modulesDelegate: ModulesHelperTestsViewControllerDelegate?
    
    open override func setupStyle() {
        let tableView = UITableView(frame: CGRect.zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.backgroundColor = UIColor.clear
        
        // This will remove extra separators from tableview
        tableView.tableFooterView = UIView(frame: CGRect.zero);
        
        view.fitSubView(view: tableView)
        self.tableView = tableView
    }
    
    open override func createModules() {
        super.createModules()
        
        for module in (modulesDelegate?.helperTestViewController(modulesHelperTest: self, tableView: self.tableView!))! {
            appendModule(module)
        }
        
        modulesDelegate?.helperTestViewControllerDidFinishToAddModules(modulesHelperTest: self, modules: modules)
    }
    
    open func adjustToFitScreen(orientation: UIInterfaceOrientation) {
        let portrait = SnapshotTestDeviceInfo().deviceSize
        let landscape = CGSize(width: portrait.height, height: portrait.width)
        var newFrame = CGRect.zero
        
        switch orientation {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown:
            newFrame.size = portrait
            break
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            newFrame.size = landscape
            break
        default:
            newFrame.size = portrait
            break
        }
        
        view.frame = newFrame
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        newFrame.size = tableView!.contentSize
        view.frame = newFrame
    }
}

public protocol ModulesHelperTestsViewControllerDelegate: NSObjectProtocol {
    func helperTestViewController(modulesHelperTest: ModulesHelperTestsViewController, tableView: UITableView)
        -> Array<TableSectionModule>
    func helperTestViewControllerDidFinishToAddModules(modulesHelperTest : ModulesHelperTestsViewController, modules: Array<TableSectionModule>)
}


public extension ModulesHelperTestsViewControllerDelegate {
    
    func helperTestViewControllerDidFinishToAddModules(modulesHelperTest : ModulesHelperTestsViewController, modules: Array<TableSectionModule>) {}
}
