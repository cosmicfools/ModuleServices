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
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        self.tableView?.estimatedRowHeight = 44
        
        self.tableView?.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func createModules() {
        super.createModules()
        
        self.appendModule(FirstSectionModule(tableView: self.tableView!))
        self.appendModule(SecondSectionModule(tableView: self.tableView!))
    }

}
