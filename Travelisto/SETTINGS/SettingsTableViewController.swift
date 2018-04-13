//
//  SettingsTableViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
}





//MARK: Row Height
extension SettingsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let languageCellHeight = CGFloat(67)
        return languageCellHeight
    }
}



//MARK: Data Source
extension SettingsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
            if indexPath.row == 2 {
                cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.remindersTVCell.rawValue) as!
                RemindersTVCell
                return cell
            }
            cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.languageTVCell.rawValue) as!
            LanguageTVCell
    
        
        return cell
    }
    
}
