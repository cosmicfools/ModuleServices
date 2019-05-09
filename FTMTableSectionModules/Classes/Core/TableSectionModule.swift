//
//  TableSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit

private struct TableSectionModuleConstants{
    static let estimatedRowHeight : CGFloat = 44
    static let estimatedHeaderFooterHeight : CGFloat = 30
    static let separatorHeight : CGFloat = 1
}

open class TableSectionModule: NSObject {
    open var rows:[AnyObject] = []
    weak internal var sectionSource: TableSectionModuleSectionSource?
    fileprivate(set) open var tableView:UITableView!
    open var section: NSInteger {
        return (sectionSource?.sectionForModule(self))!
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
    @objc
    open func registerClassForCells() -> [AnyClass] {
        return []
    }
    
    @objc
    open func registerClassForHeadersFooters() -> [AnyClass] {
        return []
    }
    
    @objc
    open func registerNibsForCells() -> [AnyClass] {
        return []
    }
    
    @objc
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
            let nib = UINib(nibName: identifier, bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    fileprivate func autoRegisterNibsForHeadersFooters() {
        for currentClass in self.registerNibsForHeadersFooters() {
            let identifier = String(describing: currentClass)
            let nib = UINib(nibName: identifier, bundle: nil)
            self.tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}

// MARK: - Methods for sepatartor of the Cells
public extension TableSectionModule {
    func setupSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = UIEdgeInsets.zero
    }
    
    func removeSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsets.init(top: CGSize.zero.height, left: cell.bounds.size.width, bottom: CGSize.zero.width, right: CGSize.zero.height)
        cell.preservesSuperviewLayoutMargins = true
        cell.layoutMargins = UIEdgeInsets.zero
    }
}

// MARK: - Mothod for Refresh the section
public extension TableSectionModule {
    func refreshSection() {
        createRows()
        tableView.reloadSections(IndexSet(integer: section), with: UITableView.RowAnimation.automatic)
    }
}

// MARK: - Autocalculate the needed height of a cells
public extension TableSectionModule {
    func dequeueDynamicHeightCellWithIdentifier(_ identifier: String) -> UITableViewCell {
        var sizingCell : UITableViewCell? = self.dynamicCells[identifier]
        if sizingCell == nil {
            sizingCell = self.tableView.dequeueReusableCell(withIdentifier: identifier)
            self.dynamicCells[identifier] = sizingCell
        }
        
        return sizingCell!
    }
    
    func calculateHeightForSizingCell(_ sizingCell: UITableViewCell) -> CGFloat {
        sizingCell.bounds = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: self.tableView.frame.width, height: sizingCell.bounds.height)
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
    
        let size : CGSize = sizingCell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let separator : CGFloat = TableSectionModuleConstants.separatorHeight / UIScreen.main.scale
        
        return size.height + separator // Add space for the cell separator height
    }
}

// MARK: - UITableViewDelegate
extension TableSectionModule {
    @objc
    open func tableView(_ tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
    
    @objc
    open func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {}
    
    @objc
    open func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGSize.zero.height
    }
    
    @objc
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var height = CGSize.zero.height
        if (tableView.style == UITableView.Style.grouped) {
            height = CGFloat.leastNormalMagnitude
        }
        return height
    }
    
    @objc
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        var height = CGSize.zero.height
        if (tableView.style == UITableView.Style.grouped) {
            height = CGFloat.leastNormalMagnitude
        }
        return height
    }
    
    @objc
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return TableSectionModuleConstants.estimatedRowHeight
    }
    
    @objc
    open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return TableSectionModuleConstants.estimatedHeaderFooterHeight
    }
    
    @objc
    open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return TableSectionModuleConstants.estimatedHeaderFooterHeight
    }
    
    @objc
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    @objc
    open func tableView(_ tableView: UITableView, didHighlightRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, willSelectRowAtIndexPath indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    @objc
    open func tableView(_ tableView: UITableView, willDeselectRowAtIndexPath indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    @objc
    open func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didDeselectRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    @objc
    open func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: IndexPath) -> String? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    @objc
    open func tableView(_ tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, didEndEditingRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: IndexPath) -> Int {
        return Int.min
    }
    
    @objc
    open func tableView(_ tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    @objc
    open func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }
    
    @objc
    open func tableView(_ tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: IndexPath, withSender sender: AnyObject?) {}
    
    @objc
    open func tableView(_ tableView: UITableView, canFocusRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    @objc
    open func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @objc
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    @objc
    open func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    @objc
    open func tableView(_ tableView: UITableView, canMoveRowAtIndexPath indexPath: IndexPath) -> Bool {
        return false
    }
    
    @objc
    open func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {}
    
    @objc
    open func tableView(_ tableView: UITableView, moveRowAtIndexPath sourceIndexPath: IndexPath, toIndexPath destinationIndexPath: IndexPath) {}
    
}
