//
//  ModulesViewController.swift
//  ModuleServices
//
//  Created by Francisco Javier Trujillo Mata on 11/5/16.
//  Copyright © 2016 FJTRUJY. All rights reserved.
//

import UIKit

open class ModulesViewController: UIViewController {
    @IBOutlet weak open var tableView:UITableView?
    private(set) internal var modules:[TableSectionModule] = []
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        createModules()
    }
    
    open override func viewWillAppear(_ animated: Bool) { modules.forEach { $0.willAppear() } }
    open override func viewWillDisappear(_ animated: Bool) { modules.forEach { module in module.willDissappear() } }
    open func setupStyle() {}
    open func createModules() { modules = [] }
    open func startFecthModules() { modules.forEach { $0.startFetch() } }
    open func stopFetchModules() { modules.forEach { $0.stopFetch() } }
}

// MARK: - TableSectionModuleSectionSource
extension ModulesViewController: TableSectionModuleSectionSource {
    public func allModules() -> [TableSectionModule] { modules }
    
    public func appendModule(_ module: TableSectionModule) {
        module.sectionSource = self;
        modules.append(module)
    }
    
    public func insertModule(_ module: TableSectionModule, atIndex: Int) {
        module.sectionSource = self;
        modules.insert(module, at: atIndex)
    }
    
    public func removeAllModules() { modules.removeAll() }
    public func removeModule(_ module: TableSectionModule) { modules.removeAll { $0 == module } }
    public func removeModuleAtIndex(_ atIndex: Int) { modules.remove(at: atIndex) }
    public func removeFirstModule() { modules.removeFirst() }
    public func removeLastModule() { modules.removeLast() }
    
    public func replaceModuleAtSection(_ section: Int, withModule module: TableSectionModule) {
        module.sectionSource = self
        modules[section] = module
    }
    
    public func sectionForModule(_ module: TableSectionModule) -> Int? {
        modules.firstIndex(of: module)
    }
    
    public func firstModule<T: TableSectionModule>() -> T? { modules.first { $0 is T } as? T }
    
    public func firstModule<T: TableSectionModule>(where predicate: (T) -> Bool) -> T? {
        modules.first {
            guard let module = $0 as? T else { return false }
            return predicate(module)
        } as? T
    }
    
    public func lastModule<T: TableSectionModule>() -> T? { modules.last { $0 is T } as? T }
    
    public func lastModule<T: TableSectionModule>(where predicate: (T) -> Bool) -> T? {
        modules.last {
            guard let module = $0 as? T else { return false }
            return predicate(module)
        } as? T
    }
    
    public func filterModules<T: TableSectionModule>() -> [T]? { modules.filter { $0 is T } as? [T] }
    
    public func filterModules<T: TableSectionModule>(where predicate: (T) -> Bool) -> [T]? {
        modules.filter {
            guard let module = $0 as? T else { return false }
            return predicate(module)
        } as? [T]
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ModulesViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, willDisplayCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        modules[section].tableView(tableView, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        modules[section].tableView(tableView, willDisplayFooterView: view, forSection: section)
    }

    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell,
                          forRowAt indexPath: IndexPath) {
        guard modules.count > indexPath.section else { return }
        modules[indexPath.section].tableView(tableView, didEndDisplayingCell: cell, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        guard modules.count > section else { return }
        modules[section].tableView(tableView, didEndDisplayingHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        guard modules.count > section else { return }
        modules[section].tableView(tableView, didEndDisplayingFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        modules[indexPath.section].tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        modules[section].tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        modules[section].tableView(tableView, heightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        modules[indexPath.section].tableView(tableView, estimatedHeightForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        modules[section].tableView(tableView, estimatedHeightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        modules[section].tableView(tableView, estimatedHeightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        modules[section].tableView(tableView, viewForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        modules[section].tableView(tableView, viewForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, accessoryButtonTappedForRowWithIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, shouldHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, didHighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, didUnhighlightRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        modules[indexPath.section].tableView(tableView, willSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        modules[indexPath.section].tableView(tableView, willDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, didDeselectRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        modules[indexPath.section].tableView(tableView, editingStyleForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        modules[indexPath.section].tableView(tableView, titleForDeleteConfirmationButtonForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        modules[indexPath.section].tableView(tableView, editActionsForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, shouldIndentWhileEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, willBeginEditingRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let validIndexPath = indexPath, validIndexPath.section < modules.count else { return }
        modules[validIndexPath.section].tableView(tableView, didEndEditingRowAtIndexPath: validIndexPath)
    }
    
    public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        modules[indexPath.section].tableView(tableView, indentationLevelForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, shouldShowMenuForRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath,
                          withSender sender: Any?) -> Bool {
        false //FIXME: Redirect to the proper module
    }
    
    public func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath,
                          withSender sender: Any?) {
        //FIXME: Redirect to the proper module
    }
    
    public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, canFocusRowAtIndexPath: indexPath)
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modules[section].rows.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        modules[indexPath.section].tableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int { modules.count }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        modules[section].tableView(tableView, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        modules[section].tableView(tableView, titleForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, canEditRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        modules[indexPath.section].tableView(tableView, canMoveRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        modules[sourceIndexPath.section].tableView(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
   }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        modules[indexPath.section].tableView(tableView, commitEditingStyle: editingStyle, forRowAtIndexPath: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath,
                          toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        modules[sourceIndexPath.section].tableView(tableView, targetIndexPathForMoveFromRowAt: sourceIndexPath,
                                                   toProposedIndexPath: proposedDestinationIndexPath)
    }
}
