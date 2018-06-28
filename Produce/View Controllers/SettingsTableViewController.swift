//
//  ViewController.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let readerModeCell: UITableViewCell = {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        cell.textLabel?.text = "Enable Reader mode by default"
        let readerSwitch = UISwitch()
        readerSwitch.setOn(Settings.sharedInstance.readerModeEnabled, animated: false)
        readerSwitch.addTarget(self, action: #selector(readerSwitchValueChanged), for: .valueChanged)
        readerSwitch.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(readerSwitch)
        readerSwitch.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -8).isActive = true
        readerSwitch.centerYAnchor.constraint(equalTo: cell.centerYAnchor).isActive = true
        
        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
    @objc func readerSwitchValueChanged() {
        Settings.sharedInstance.readerModeEnabled = !Settings.sharedInstance.readerModeEnabled
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.superview?.backgroundColor = .black
        cell.textLabel?.textColor = .white
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.readerModeCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

