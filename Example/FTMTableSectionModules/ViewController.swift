//
//  ViewController.swift
//  FTMTableSectionModules
//
//  Created by Francisco Javier Trujillo Mata on 05/11/2016.
//  Copyright (c) 2016 Francisco Javier Trujillo Mata. All rights reserved.
//

import FTMTableSectionModules

class ViewController: ModulesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.estimatedRowHeight = 44
        
        tableView?.tableFooterView = UIView()
    }
    
    override func createModules() {
        super.createModules()
        if let tableV = tableView {
            appendModule(HelloWorldModule(tableView: tableV))
            appendModule(FirstSectionModule(tableView: tableV))
            appendModule(SecondSectionModule(tableView: tableV))
        }
    }

}
