//
//  TableSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

private struct TableSectionModuleConstants{
    static let EstimatedHeight : CGFloat = 44
    static let SeparatorHeight : CGFloat = 1
}

open class TableSectionModule: NSObject {
    open var rows:[AnyObject] = []
    weak internal var sectionSource: TableSectionModuleSectionSource?
    fileprivate(set) open var tableView:UITableView!
    fileprivate(set) open var section:NSInteger{
        get {
            return (self.sectionSource?.sectionForModule(self))!
        }
        set { self.section = newValue }
    }
    fileprivate(set) open var isPresented:Bool = false
    fileprivate(set) open var isFetching:Bool = false
    fileprivate var dynamicCells = Dictionary<String, UITableViewCell>()
    
    public init(tableView:UITableView) {
        super.init()
        self.tableView = tableView
        
        self.registerViews()
        self.createRows()
    }
    
    open func registerViews() {
        self.autoRegisterViews()
    }
    
    open func createRows() {
        self.rows = []
    }
    
    open func startFetch() {
        self.isFetching = true
    }
    
    open func stopFetch() {
        self.isFetching = false
    }
    
    internal func willAppear() {
        self.isPresented = true
    }
    
    internal func willDissappear() {
        self.isPresented = false
    }
}

// MARK: - Private Protocol for auto control of the section
internal protocol TableSectionModuleSectionSource : NSObjectProtocol {
    func sectionForModule(_ module: TableSectionModule) -> NSInteger
}

// MARK: - Autoregistration of Cells, Header and Footer methods
extension TableSectionModule {
    fileprivate func autoRegisterViews() {
        self.autoRegisterClassForCells()
        self.autoRegisterClassForHeadersFooters()
        self.autoRegisterNibsForCells()
        self.autoRegisterNibsForHeadersFooters()
    }
    
    //Autoregistrion - Override those methods if the ReuseIdentifier is exactly the same that the Class and the Nib file (if exits)
    open func registerClassForCells() -> [AnyClass] {
        return []
    }
    
    open func registerClassForHeadersFooters() -> [AnyClass] {
        return []
    }
    
    open func registerNibsForCells() -> [AnyClass] {
        return []
    }
    
    open func registerNibsForHeadersFooters() -> [AnyClass] {
        return []
    }
    
    fileprivate func autoRegisterClassForCells() {
        for currentClass in self.registerClassForCells() {
            let identifier = String(describing: currentClass)
            self.tableView.register(currentClass, forCellReuseIdentifier: identifier)
        }
    }
    
    fileprivate func autoRegisterClassForHeadersFooters() {
        for currentClass in self.registerClassForHeadersFooters() {
            let identifier = String(describing: currentClass)
            self.tableView.register(currentClass, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
    fileprivate func autoRegisterNibsForCells() {
        for currentClass in self.registerNibsForCells() {
            let identifier = String(describing: currentClass)
            let nib = UINib.init(nibName: identifier, bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    fileprivate func autoRegisterNibsForHeadersFooters() {
        for currentClass in self.registerNibsForHeadersFooters() {
            let identifier = String(describing: currentClass)
            let nib = UINib.init(nibName: identifier, bundle: nil)
            self.tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}

// MARK: - Methods for sepatartor of the Cells
public extension TableSectionModule {
    public func setupSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
    public func removeSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsetsMake(CGSize.zero.height, cell.bounds.size.width, CGSize.zero.width, CGSize.zero.height)
        cell.preservesSuperviewLayoutMargins = true
        cell.layoutMargins = UIEdgeInsets.zero
    }
}

// MARK: - Autocalculate the needed height of a cells
public extension TableSectionModule {
    public func dequeueDynamicHeightCellWithIdentifier(_ identifier: String) -> UITableViewCell {
        var sizingCell : UITableViewCell? = self.dynamicCells[identifier]
        if sizingCell == nil {
            sizingCell = self.tableView.dequeueReusableCell(withIdentifier: identifier)
            self.dynamicCells[identifier] = sizingCell
        }
        
        return sizingCell!
    }
    
    public func calculateHeightForSizingCell(_ sizingCell: UITableViewCell) -> CGFloat {
        sizingCell.bounds = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: self.tableView.frame.width, height: sizingCell.bounds.height)
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
    
        let size : CGSize = sizingCell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        let separator : CGFloat = TableSectionModuleConstants.SeparatorHeight / UIScreen.main.scale
        
        return size.height + separator // Add space for the cell separator height
    }
}

// MARK: - UITableViewDelegate
internal extension TableSectionModule {
    internal func tableView(_ tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
    
    internal func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
    
    internal func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {}
    
    internal func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {}
    
    internal func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGSize.zero.height
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height = CGSize.zero.height
        if (tableView.style == UITableViewStyle.grouped) {
            height = CGFloat.leastNormalMagnitude
        }
        return height
    }
    
    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height = CGSize.zero.height
        if (tableView.style == UITableViewStyle.grouped) {
            height = CGFloat.leastNormalMagnitude
        }
        return height
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return TableSectionModuleConstants.EstimatedHeight
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return CGSize.zero.height
    }
    
    internal func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return CGSize.zero.height
    }
    
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    internal func tableView(_ tableView: UITableView, didHighlightRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, willSelectRowAtIndexPath indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    internal func tableView(_ tableView: UITableView, willDeselectRowAtIndexPath indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, didDeselectRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    internal func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: IndexPath) -> String? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    internal func tableView(_ tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, didEndEditingRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: IndexPath) -> Int {
        return Int.min
    }
    
    internal func tableView(_ tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    internal func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    internal func tableView(_ tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: AnyObject?) {}
    
    internal func tableView(_ tableView: UITableView, canFocusRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    internal func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    internal func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    internal func tableView(_ tableView: UITableView, canMoveRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    internal func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {}
    
    internal func tableView(_ tableView: UITableView, moveRowAtIndexPath sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {}
    
}
