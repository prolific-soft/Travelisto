//
//  SettingSelectionTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SettingSelectionTVC: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = true
 
        
    }
    
    var dataCount = 0

    //Languages
    var languages : [Clanguage]?{
        didSet {
            dataCount = languages?.count ?? 0
            filteredLanguages = languages
        }
    }
    var filteredLanguages : [Clanguage]?
    
    
    
    //Currencies
    var currencies : [String : Ccurrency]?{
        didSet {
            dataCount = currencies?.count ?? 0
            filteredCurrency = currencies
        }
    }
    var filteredCurrency : [String : Ccurrency]?
    

    
    var isSelected = false
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
    }
 
}


//MARK: Search Bar Filter
extension SettingSelectionTVC {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        //Filter languages
        if languages != nil {
            if !searchText.isEmpty {
                filteredLanguages = languages?.filter { language in
                    return language.name.lowercased().contains(searchText.lowercased())
                }
                dataCount = (filteredLanguages?.count)!
            } else {
                filteredLanguages = languages
                dataCount = (filteredLanguages?.count)!
            }
            tableView.reloadData()
        }
        
        //Filter Currencies
        if currencies != nil {
            if !searchText.isEmpty {
                filteredCurrency = currencies?.filter({ (currencyDict) -> Bool in
                    return currencyDict.value.name.lowercased().contains(searchText.lowercased())
                })
                dataCount = (filteredCurrency?.count)!
            } else {
                filteredCurrency = currencies
                dataCount = (filteredCurrency?.count)!
            }
            tableView.reloadData()
        }

        
    }

    
}



//MARK: Row Height
extension SettingSelectionTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
    
}



//MARK: Data Source
extension SettingSelectionTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.settingSelectionTVCell.rawValue) as!
        SettingSelectionTVCell
        
        
        if let loadedLanguages = filteredLanguages {
            let singleLanguage = loadedLanguages[indexPath.row]
            cell.subtitleLabel.text = singleLanguage.name
            cell.valueLabel.text = singleLanguage.nativeName
            cell.accessoryIcon.isHidden = true
        }
        
        
        if let loadedCurrencies = filteredCurrency {
            let singleCurrencyKey = Array(loadedCurrencies.keys)[indexPath.row]
            let currency = loadedCurrencies[singleCurrencyKey]
            cell.subtitleLabel.text = currency?.name
            cell.valueLabel.text = "\(currency?.symbol?.grapheme  ?? " ") (\(singleCurrencyKey))"
            cell.accessoryIcon.isHidden = true
        }
        
        return cell
    }
    
}

/// MARK: - Navigation & Segue
extension SettingSelectionTVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath as IndexPath) as? SettingSelectionTVCell
        if(isSelected){
            cell?.accessoryIcon.isHidden = true
            isSelected = false
        }else {
            cell?.accessoryIcon.isHidden = false
            isSelected = true
        }
    }
    
    
}





