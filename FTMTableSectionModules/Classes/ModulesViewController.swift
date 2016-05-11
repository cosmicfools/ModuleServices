//
//  ModulesViewController.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Foundation

public class ModulesViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView?
    private(set) internal var modules:[TableSectionModule] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.createModules()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    internal func createModules() {
        self.modules = []
    }

}

// MARK: - TableSectionModuleSectionSource
extension ModulesViewController: TableSectionModuleSectionSource {
    public func appendModule(module: TableSectionModule) {
        module.sectionSource = self;
        self.modules.append(module)
    }
    
    public func insertModule(module: TableSectionModule, atIndex: Int) {
        module.sectionSource = self;
        self.modules.insert(module, atIndex: atIndex)
    }
    
    public func removeAllModules() {
        self.modules.removeAll()
    }
    
    public func removeModuleAtIndex(atIndex: Int) {
        self.modules.removeAtIndex(atIndex)
    }
    
    public func removeFirstModule() {
        self.modules.removeFirst()
    }
    
    public func removeLastModule() {
        self.modules.removeLast()
    }
    
    public func replaceModuleAtSection(section: NSInteger, withModule module: TableSectionModule) {
        module.sectionSource = self
        self.modules[section] = module
    }
    
    public func sectionForModule(module: TableSectionModule) -> NSInteger {
        return (self.modules.indexOf(module))!
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ModulesViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, willDisplayFooterView: view, forSection: section)
    }

    public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didEndDisplayingCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        return self.modules[section].tableView(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.modules[indexPath.section].tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, heightForFooterInSection: section)
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.modules[indexPath.section].tableView(tableView, estimatedHeightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, estimatedHeightForHeaderInSection: section)
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.modules[section].tableView(tableView, estimatedHeightForFooterInSection: section)
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.modules[section].tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.modules[section].tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, accessoryButtonTappedForRowWithIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didUnhighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return self.modules[indexPath.section].tableView(tableView, willSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return self.modules[indexPath.section].tableView(tableView, willDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return self.modules[indexPath.section].tableView(tableView, editingStyleForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return self.modules[indexPath.section].tableView(tableView, titleForDeleteConfirmationButtonForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return self.modules[indexPath.section].tableView(tableView, editActionsForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldIndentWhileEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, willBeginEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, didEndEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath {
        return proposedDestinationIndexPath
    }
    
    public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return self.modules[indexPath.section].tableView(tableView, indentationLevelForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, shouldShowMenuForRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canPerformAction: action, forRowAtIndexPath: indexPath, withSender: sender)
    }
    
    public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        return self.modules[indexPath.section].tableView(tableView, performAction: action, forRowAtIndexPath: indexPath, withSender: sender)
    }
    
    public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canFocusRowAtIndexPath: indexPath)
    }

    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modules[section].rows.count
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return self.modules[indexPath.section].tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.modules.count
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.modules[section].tableView(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.modules[section].tableView(tableView, titleForFooterInSection: section)
    }
    
    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canEditRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return self.modules[indexPath.section].tableView(tableView, canMoveRowAtIndexPath: indexPath)
    }
    
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        return self.modules[indexPath.section].tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    }
}
