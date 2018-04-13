//
//  SettingsTableViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    var settingsData : [String : String]!

    let keyArray = ["Language", "Currency", "Reminders", "Units", "Privacy"]
    let valueArray = ["English", "USD", " ", "Imperial", " "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
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
        return settingsData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        

        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.languageTVCell.rawValue) as!
            LanguageTVCell
            cell.subtitleLabel.text = keyArray[indexPath.row]
            cell.valueLabel.text = valueArray[indexPath.row]
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.languageTVCell.rawValue) as!
            LanguageTVCell
            cell.subtitleLabel.text = keyArray[indexPath.row]
            cell.valueLabel.text = valueArray[indexPath.row]
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.remindersTVCell.rawValue) as!
            RemindersTVCell
            cell.subtitleLabel.text =  keyArray[indexPath.row]
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.languageTVCell.rawValue) as!
            LanguageTVCell
            cell.subtitleLabel.text = keyArray[indexPath.row]
            cell.valueLabel.text = valueArray[indexPath.row]
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.languageTVCell.rawValue) as!
            LanguageTVCell
            cell.subtitleLabel.text = keyArray[indexPath.row]
            cell.valueLabel.text = valueArray[indexPath.row]
            return cell
        default:
            break
        }

        return cell
    }
    
}


extension SettingsTableViewController {
    
    func loadData(){
        let tableViewData = ["Language" : "English",
                             "Currency" : "USD",
                             "Units" : "Imperial",
                             "Reminders" : "",
                             "Privacy" : ""]
        self.settingsData = tableViewData
    }
}

/// MARK: - Navigation & Segue
extension SettingsTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toSettingSelectionTVC.rawValue {
            
            guard let indexPath = sender as? NSIndexPath else { return }
            
            if indexPath.row == 2 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? RemindersTVCell
                if let remindersTVC = segue.destination as? SettingSelectionTVC {
                    remindersTVC.navigationItem.title =  keyArray[indexPath.row]
                }
                
            } else if indexPath.row == 4 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let privacyTVC = segue.destination as? PrivacyTVC {
                    privacyTVC.navigationItem.title =  keyArray[indexPath.row]
                }
                
            }else {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let remindersTVC = segue.destination as? SettingSelectionTVC {
                    remindersTVC.navigationItem.title =  keyArray[indexPath.row]
                }
            }
            

        }
    }// End prepare for Segue
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            self.performSegue(withIdentifier: Segue.toPrivacyTVC.rawValue, sender: indexPath)
        }else {
            self.performSegue(withIdentifier: Segue.toSettingSelectionTVC.rawValue, sender: indexPath)
        }
        
    }
}
