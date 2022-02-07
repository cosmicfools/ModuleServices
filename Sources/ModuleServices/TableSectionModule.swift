//
//  TableSectionModule.swift
//  ModuleServices
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit

private enum Constants {
    static let separatorHeight: CGFloat = 1
}

open class TableSectionModule: NSObject {
    open var rows:[Any] = []
    weak internal var sectionSource: TableSectionModuleSectionSource?
    
    private(set) open var tableView: UITableView
    private(set) open var isPresented: Bool = false
    private(set) open var isFetching: Bool = false
    private var dynamicCells: [String: UITableViewCell] = [:]
    
    open var section: Int { (sectionSource?.sectionForModule(self) ?? NSNotFound) }
    
    public init(tableView:UITableView) {
        self.tableView = tableView
        super.init()
        
        registerViews()
        createRows()
        setupNotifications()
    }
    
    open func registerViews() { autoRegisterViews() }
    open func createRows() { rows = [] }
    open func startFetch() { isFetching = true }
    open func stopFetch() { isFetching = false }
    open func willAppear() { isPresented = true }
    open func willDissappear() { isPresented = false }
    
    // MARK: - Autoregistration of Cells, Header and Footer methods
    open func moduleBundle() -> Bundle? { nil }
    open func registerClassForCells() -> [AnyClass] { [] }
    open func registerClassForHeadersFooters() -> [AnyClass] { [] }
    open func registerNibsForCells() -> [AnyClass] { [] }
    open func registerNibsForHeadersFooters() -> [AnyClass] { [] }
    
    
    // MARK: - UITableViewDelegate
    open func tableView(_ tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
    
    open func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
    
    open func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell,
                        forRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {}
    
    open func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {}
    
    open func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat { .zero }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard tableView.style != .grouped else { return .leastNormalMagnitude }
        return .zero
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard tableView.style != .grouped else { return .leastNormalMagnitude }
        return .zero
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        .leastNormalMagnitude
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        .leastNormalMagnitude
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? { nil }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? { nil }
    
    open func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: IndexPath) -> Bool { true }
    
    open func tableView(_ tableView: UITableView, didHighlightRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, willSelectRowAtIndexPath indexPath: IndexPath) -> IndexPath? { indexPath }
    
    open func tableView(_ tableView: UITableView, willDeselectRowAtIndexPath indexPath: IndexPath) -> IndexPath? { indexPath }
    
    open func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, didDeselectRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, editingStyleForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    open func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: IndexPath) -> String? { nil }
    
    open func tableView(_ tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath) -> [UITableViewRowAction]? { nil }
    
    open func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: IndexPath) -> Bool { true }
    
    open func tableView(_ tableView: UITableView, willBeginEditingRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, didEndEditingRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, indentationLevelForRowAtIndexPath indexPath: IndexPath) -> Int { .min }
    
    open func tableView(_ tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: IndexPath) -> Bool { false }
    
    open func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: IndexPath,
                        withSender sender: AnyObject?) -> Bool { false }
    
    open func tableView(_ tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: IndexPath,
                        withSender sender: AnyObject?) {}
    
    open func tableView(_ tableView: UITableView, canFocusRowAtIndexPath indexPath: IndexPath) -> Bool { true }
    
    open func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell { .init() }
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { nil }
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? { nil }
    
    open func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool { false }
    
    open func tableView(_ tableView: UITableView, canMoveRowAtIndexPath indexPath: IndexPath) -> Bool { false }
    
    open func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle,
                        forRowAtIndexPath indexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, moveRowAtIndexPath sourceIndexPath: IndexPath,
                        toIndexPath destinationIndexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,
                        to destinationIndexPath: IndexPath) {}
    
    open func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
                        toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        proposedDestinationIndexPath
    }
    
    // MARK: - Methods for sepatartor of the Cells
    func setupSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = .zero
        cell.preservesSuperviewLayoutMargins = false
        cell.layoutMargins = .zero
    }
    
    func removeSeparatorInsetForCell(_ cell : UITableViewCell, forIndexPath indexPath : IndexPath) {
        // Remove seperator inset
        cell.separatorInset = UIEdgeInsets.init(top: .zero, left: cell.bounds.size.width, bottom: .zero, right: .zero)
        cell.preservesSuperviewLayoutMargins = true
        cell.layoutMargins = .zero
    }
    
    // MARK: - Mothod for Refresh the section
    func refreshSection() {
        createRows()
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}

// MARK: - Autocalculate the needed height of a cells
public extension TableSectionModule {
    func dequeueDynamicHeightCellWithIdentifier(_ identifier: String) -> UITableViewCell? {
        switch dynamicCells[identifier] {
        case .some(let sizingCell): return sizingCell
        default:
            let sizingCell = tableView.dequeueReusableCell(withIdentifier: identifier)
            dynamicCells[identifier] = sizingCell
            return sizingCell
        }
    }
    
    func calculateHeightForSizingCell(_ sizingCell: UITableViewCell) -> CGFloat {
        sizingCell.bounds = CGRect(origin: .zero, size: CGSize(width: tableView.frame.width, height: sizingCell.bounds.height))
        sizingCell.setNeedsLayout()
        sizingCell.layoutIfNeeded()
    
        let size = sizingCell.contentView.systemLayoutSizeFitting(sizingCell.bounds.size, withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .fittingSizeLevel)
        let separator = Constants.separatorHeight / UIScreen.main.scale
        
        return size.height + separator // Add space for the cell separator height
    }
}

// MARK: - Private Methods for Autoregistration
private extension TableSectionModule {
    //Autoregistrion - Override those methods if the ReuseIdentifier is exactly the same that the Class and the Nib file (if exits)
    func autoRegisterViews() {
        autoRegisterClassForCells()
        autoRegisterClassForHeadersFooters()
        autoRegisterNibsForCells()
        autoRegisterNibsForHeadersFooters()
    }
    
    func autoRegisterClassForCells() {
        registerClassForCells().forEach {
            tableView.register($0, forCellReuseIdentifier: String(describing: $0))
        }
    }
    
    func autoRegisterClassForHeadersFooters() {
        registerClassForHeadersFooters().forEach {
            tableView.register($0, forHeaderFooterViewReuseIdentifier: String(describing: $0))
        }
    }
    
    func autoRegisterNibsForCells() {
        registerNibsForCells().forEach {
            let identifier = String(describing: $0)
            let nib = UINib(nibName: identifier, bundle: moduleBundle())
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    func autoRegisterNibsForHeadersFooters() {
        registerNibsForHeadersFooters().forEach {
            let identifier = String(describing: $0)
            let nib = UINib(nibName: identifier, bundle: moduleBundle())
            tableView.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
    
}

// MARK: - Notifications for CodeInjection
private extension TableSectionModule {
    func setupNotifications() {
        let notification = Notification.Name("INJECTION_BUNDLE_NOTIFICATION")
        NotificationCenter.default.addObserver(self, selector: #selector(injectedCode(_:)), name: notification,
                                               object: nil)
    }
    
    @objc func injectedCode(_ notification: Notification) {
        refreshSection()
    }
}

// MARK: - Private Protocol for auto control of the section
internal protocol TableSectionModuleSectionSource : NSObjectProtocol {
    func sectionForModule(_ module: TableSectionModule) -> Int?
}
