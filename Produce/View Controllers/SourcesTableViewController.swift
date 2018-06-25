//
//  SourcesTableViewController.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-25.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import Foundation
import UIKit

class SourcesTableViewController: UITableViewController {
    
    var sources = [Source]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        Source.fetchSources { (sources) in
            guard let sources = sources else { return }
            self.sources = sources
            self.tableView.reloadData()
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sourceCell")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sourceCell", for: indexPath)
        
        cell.contentView.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = sources[indexPath.row].name
        
        return cell
    }
}
