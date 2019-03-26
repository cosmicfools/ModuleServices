//
//  ModulesViewController.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit
import Foundation

open class ModulesViewController: UIViewController {

    @IBOutlet weak open var tableView:UITableView?
    fileprivate(set) internal var modules:[TableSectionModule] = []
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.createModules()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        for module in self.modules {
            module.willAppear()
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        for module in self.modules {
            module.willDissappear()
        }
    }

    open func createModules() {
        self.modules = []
    }
    
    open func startFecthModules() {
        for module in self.modules {
            module.startFetch()
        }
    }
    
    open func stopFetchModules() {
        for module in self.modules {
            module.stopFetch()
        }
    }
}

// MARK: - TableSectionModuleSectionSource
extension ModulesViewController: TableSectionModuleSectionSource {
    public func appendModule(_ module: TableSectionModule) {
        module.sectionSource = self;
        self.modules.append(module)
    }
    
    public func insertModule(_ module: TableSectionModule, atIndex: Int) {
        module.sectionSource = self;
        self.modules.insert(module, at: atIndex)
    }
    
    public func removeAllModules() {
        self.modules.removeAll()
    }
    
    public func removeModuleAtIndex(_ atIndex: Int) {
        self.modules.remove(at: atIndex)
    }
    
    public func removeFirstModule() {
        self.modules.removeFirst()
    }
    
    public func removeLastModule() {
        self.modules.removeLast()
    }
    
    public func replaceModuleAtSection(_ section: NSInteger, withModule module: TableSectionModule) {
        module.sectionSource = self
        self.modules[section] = module
    }
    
    public func sectionForModule(_ module: TableSectionModule) -> NSInteger {
        return (self.modules.firstIndex(of: module))!
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ModulesViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, willDisplayFooterView: view, forSection: section)
    }

    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didEndDisplayingCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.modules[indexPath.section].tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, heightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.modules[indexPath.section].tableView(tableView, estimatedHeightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, estimatedHeightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, estimatedHeightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.modules[section].tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.modules[section].tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, accessoryButtonTappedForRowWithIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didUnhighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return self.modules[indexPath.section].tableView(tableView, willSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return self.modules[indexPath.section].tableView(tableView, willDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return self.modules[indexPath.section].tableView(tableView, editingStyleForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return self.modules[indexPath.section].tableView(tableView, titleForDeleteConfirmationButtonForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return self.modules[indexPath.section].tableView(tableView, editActionsForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldIndentWhileEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, willBeginEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        return self.modules[indexPath!.section].tableView(tableView, didEndEditingRowAtIndexPath: indexPath!)
    }
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath
    }
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return self.modules[indexPath.section].tableView(tableView, indentationLevelForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldShowMenuForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false //FIXME: Redirect to the proper module
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        //FIXME: Redirect to the proper module
    }
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canFocusRowAtIndexPath: indexPath)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modules[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.modules[indexPath.section].tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.modules.count
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.modules[section].tableView(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.modules[section].tableView(tableView, titleForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canEditRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canMoveRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        return self.modules[indexPath.section].tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    }
}
