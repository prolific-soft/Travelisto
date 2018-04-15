//
//  SettingsTableViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    //Class Properties
    var settingsData : [String : String]!
    let keyArray = ["Language", "Currency", "Reminders", "Units", "Privacy Policy"]
    let valueArray = ["English", "USD", " ", "Imperial", " "]
    var languages : [Clanguage]?
    var currencies : CcurrencyStruct?
    var units : CunitStruct?
    
    
    @IBOutlet weak var proifleImageViev: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set Up Profile Image
        proifleImageViev.layer.borderWidth = 0.5
        proifleImageViev.layer.masksToBounds = false
        proifleImageViev.layer.borderColor = UIColor.lightGray.cgColor
        proifleImageViev.layer.cornerRadius = proifleImageViev.frame.height/2
        proifleImageViev.clipsToBounds = true
        
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
        
        //Load Languages
        let filePath = Bundle.main.path(forResource: "languages", ofType: "json")
        let url = URL(fileURLWithPath: filePath!)
        
        do {
            let data = try Data(contentsOf: url)
            let loadedLanguages = try JSONDecoder().decode([Clanguage].self, from: data)
            languages = loadedLanguages
        }catch let error as NSError {
            print("Error Loading Languages : \(error)")
        }
        
        //Load Currency
        let currencyfilePath = Bundle.main.path(forResource: "currency", ofType: "json")
        let currencyUrl = URL(fileURLWithPath: currencyfilePath!)
        
        do {
            let currencyData = try Data(contentsOf: currencyUrl)
            let money = try JSONDecoder().decode([String : Ccurrency].self, from: currencyData)
            currencies = CcurrencyStruct(data: money)
        }catch let error as NSError {
            print("Error Loading Currency : \(error)")
        }
        
        //Load Units
        let unitfilePath = Bundle.main.path(forResource: "units", ofType: "json")
        let unitUrl = URL(fileURLWithPath: unitfilePath!)
        
        do {
            let unitData = try Data(contentsOf: unitUrl)
            let unitType = try JSONDecoder().decode([String : Cunit].self, from: unitData)
            units = CunitStruct(data: unitType)
        }catch let error as NSError {
            print("Error Loading U : \(error)")
        }
        
        
    }
}

/// MARK: - Navigation & Segue
extension SettingsTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toSettingSelectionTVC.rawValue {
            
            guard let indexPath = sender as? NSIndexPath else { return }
            
            //Currency
            if indexPath.row == 1 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let settingSelectionTVC = segue.destination as? SettingSelectionTVC {
                    settingSelectionTVC.navigationItem.title =  keyArray[indexPath.row]
                    guard let loadedCurrencies = self.currencies?.data else { return }
                    settingSelectionTVC.currencies = loadedCurrencies
                }
            }
            
            //Reminder
            else if indexPath.row == 2 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? RemindersTVCell
                if let remindersTVC = segue.destination as? SettingSelectionTVC {
                    remindersTVC.navigationItem.title =  keyArray[indexPath.row]
                }
               
              //Privacy
            } else if indexPath.row == 4 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let privacyTVC = segue.destination as? PrivacyTVC {
                    privacyTVC.navigationItem.title =  keyArray[indexPath.row]
                }
                
                //Units
            } else if indexPath.row == 3 {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let settingSelectionTVC = segue.destination as? SettingSelectionTVC {
                    settingSelectionTVC.navigationItem.title =  keyArray[indexPath.row]
                    guard let loadedUnit = self.units?.data else { return }
                    settingSelectionTVC.units = loadedUnit
                }
              
                //Language
            }else {
                _ = tableView.cellForRow(at: indexPath as IndexPath) as? LanguageTVCell
                if let settingSelectionTVC = segue.destination as? SettingSelectionTVC {
                    settingSelectionTVC.navigationItem.title =  keyArray[indexPath.row]
                    settingSelectionTVC.languages = languages
                }
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4 {
            self.performSegue(withIdentifier: Segue.toPrivacyTVC.rawValue, sender: indexPath)
        }else if indexPath.row == 2 {
            return
        }else {
            self.performSegue(withIdentifier: Segue.toSettingSelectionTVC.rawValue, sender: indexPath)
        }
        
    }
}
