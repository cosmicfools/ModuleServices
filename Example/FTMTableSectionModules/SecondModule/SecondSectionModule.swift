//
//  SecondSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 24/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import FTMTableSectionModules

class SecondSectionModule: TableSectionModule {
    private var infoToShow : Array<String>
    private var boldAttributes : [String : Any]
    private var italianAttributes : [String : Any]
    
    override init(tableView: UITableView) {
        self.infoToShow = [
            "Lorem fistrum condemor papaar papaar torpedo mamaar pecador.",
            "Pupita al ataquerl a wan quietooor.",
            "Pupita sexuarl fistro condemor papaar papaar benemeritaar se calle ustée a peich.",
            "Está la cosa muy malar se calle ustée ahorarr diodeno benemeritaar hasta luego Lucas jarl diodeno caballo blanco caballo negroorl fistro tiene musho peligro.",
        ]
        
        self.boldAttributes = [
            NSFontAttributeName : UIFont.boldSystemFont(ofSize:15),
            NSForegroundColorAttributeName : UIColor.blue,
        ]
        
        self.italianAttributes = [
            NSFontAttributeName : UIFont.italicSystemFont(ofSize:12),
            NSForegroundColorAttributeName : UIColor.gray,
        ]
        
        super.init(tableView: tableView)
    }
    
    override func createRows() {
        super.createRows()
        
        for _ : String in self.infoToShow {
            self.rows.append(String(describing: ConfigurableTableViewCell.self) as AnyObject)
        }
    }
    
    override func registerNibsForCells() -> [AnyClass] {
        return super.registerNibsForCells() + [
            ConfigurableTableViewCell.classForCoder(),
        ]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = self.rows[indexPath.row] as! String
        let cell : ConfigurableTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ConfigurableTableViewCell
        
        let attr : NSMutableAttributedString = NSMutableAttributedString()
        
        attr.append(NSAttributedString(string: String(indexPath.row) + " ", attributes: self.boldAttributes));
        attr.append(NSAttributedString(string: self.infoToShow[indexPath.row], attributes: italianAttributes));
        
        cell.configureWithAttributedString(attr.copy() as! NSAttributedString)
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
