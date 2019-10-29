//
//  SecondSectionModule.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 24/08/2017.
//  Copyright © 2017 FJTRUJY. All rights reserved.
//

import FTMTableSectionModules

class SecondSectionModule: TableSectionModule {
    private var infoToShow : [String]
    private var boldAttributes : [NSAttributedString.Key : Any]
    private var italianAttributes : [NSAttributedString.Key : Any]
    
    override init(tableView: UITableView) {
        infoToShow = [
            "Lorem fistrum condemor papaar papaar torpedo mamaar pecador.",
            "Pupita al ataquerl a wan quietooor.",
            "Pupita sexuarl fistro condemor papaar papaar benemeritaar se calle ustée a peich.",
            "Está la cosa muy malar se calle ustée ahorarr diodeno benemeritaar hasta luego Lucas jarl diodeno caballo blanco caballo negroorl fistro tiene musho peligro.",
        ]
        
        boldAttributes = [
            .font : UIFont.boldSystemFont(ofSize:15),
            .foregroundColor : UIColor.blue,
        ]
        
        italianAttributes = [
            .font : UIFont.italicSystemFont(ofSize:12),
            .foregroundColor : UIColor.gray,
        ]
        
        super.init(tableView: tableView)
    }
    
    override func createRows() {
        super.createRows()
        
        infoToShow.forEach { _ in
            rows.append(String(describing: ConfigurableTableViewCell.self))
        }
    }
    
    override func registerNibsForCells() -> [AnyClass] {
        return super.registerNibsForCells() + [
            ConfigurableTableViewCell.classForCoder(),
        ]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = rows[indexPath.row] as! String
        let cell : ConfigurableTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ConfigurableTableViewCell
        
        let attr : NSMutableAttributedString = NSMutableAttributedString()
        
        attr.append(NSAttributedString(string: String(indexPath.row) + " ", attributes: boldAttributes));
        attr.append(NSAttributedString(string: infoToShow[indexPath.row], attributes: italianAttributes));
        
        cell.configureWithAttributedString(attr.copy() as! NSAttributedString)
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
