//
//  TableSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

private struct TableSectionModuleConstants{
    static let EstimatedHeight: CGFloat = 44
}

public class TableSectionModule: NSObject {
    public var rows:[AnyObject] = []
    weak internal var sectionSource: TableSectionModuleSectionSource?
    private(set) public var tableView:UITableView!
    private(set) public var section:NSInteger{
        get {
            return (self.sectionSource?.sectionForModule(self))!
        }
        set { self.section = newValue }
    }
    
    public init(tableView:UITableView) {
        super.init()
        self.tableView = tableView
        
        self.registerViews()
        self.createRows()
    }
    
    public func registerViews() {
        self.autoRegisterViews()
    }
    
    public func createRows() {
        self.rows = []
    }
}

// MARK: - Private Protocol for auto control of the section
internal protocol TableSectionModuleSectionSource : NSObjectProtocol {
    func sectionForModule(module: TableSectionModule) -> NSInteger
}

// MARK: - Autoregistration of Cells, Header and Footer methods
extension TableSectionModule {
    private func autoRegisterViews() {
        self.autoRegisterClassForCells()
        self.autoRegisterClassForHeadersFooters()
        self.autoRegisterNibsForCells()
        self.autoRegisterNibsForHeadersFooters()
    }
    
    //Autoregistrion - Override those methods if the ReuseIdentifier is exactly the same that the Class and the Nib file (if exits)
    public func registerClassForCells() -> [AnyClass] {
        return []
    }
    
    public func registerClassForHeadersFooters() -> [AnyClass] {
        return []
    }
    
    public func registerNibsForCells() -> [AnyClass] {
        return []
    }
    
    public func registerNibsForHeadersFooters() -> [AnyClass] {
        return []
    }
    
    private func autoRegisterClassForCells() {
        for currentClass in self.registerClassForCells() {
            let identifier = String(currentClass)
            self.tableView.registerClass(currentClass, forCellReuseIdentifier: identifier)
        }
    }
    
    private func autoRegisterClassForHeadersFooters() {
        for currentClass in self.registerClassForHeadersFooters() {
            let identifier = String(currentClass)
            self.tableView.registerClass(currentClass, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    private func autoRegisterNibsForCells() {
        for currentClass in self.registerNibsForCells() {
            let identifier = String(currentClass)
            let nib = UINib.init(nibName: identifier, bundle: nil)
            self.tableView.registerNib(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    private func autoRegisterNibsForHeadersFooters() {
        for currentClass in self.registerNibsForHeadersFooters() {
            let identifier = String(currentClass)
            let nib = UINib.init(nibName: identifier, bundle: nil)
            self.tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}

// MARK: - UITableViewDelegate
extension TableSectionModule: UITableViewDelegate{
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
    
    public func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
    
    public func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {}
    
    public func tableView(tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {}
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGSizeZero.height
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height = CGSizeZero.height
        if (tableView.style == UITableViewStyle.Grouped) {
            height = CGFloat.min
        }
        return height
    }
    
    public func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height = CGSizeZero.height
        if (tableView.style == UITableViewStyle.Grouped) {
            height = CGFloat.min
        }
        return height
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return TableSectionModuleConstants.EstimatedHeight
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGSizeZero.height
    }
    
    public func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return CGSizeZero.height
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    public func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    public func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    public func tableView(tableView: UITableView, willDeselectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return indexPath
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.None
    }
    
    public func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return nil
    }
    
    public func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    public func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func tableView(tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, didEndEditingRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: NSIndexPath) -> Int {
        return Int.min
    }
    
    public func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    public func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {}
    
    public func tableView(tableView: UITableView, canFocusRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    public func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    public func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    public func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    public func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    public func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {}
    
}
