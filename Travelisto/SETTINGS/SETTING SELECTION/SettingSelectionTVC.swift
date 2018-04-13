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
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = true
        
        if let dData = data {
            currentData = dData
        }
        
    }
    
    var currentData = [Codable]()
    var data : [Codable]?{
        didSet {
            print("Data was set @ Setting Selection")
            
        }
    }
    

    
    var isSelected = false
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
    }
 
}


//MARK: Search Bar Filter
extension SettingSelectionTVC {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(currentData is [Clanguage]){
            guard !searchText.isEmpty else {
                currentData = data!
                tableView.reloadData()
                return
            }
            currentData = data!.filter({ (word) -> Bool in
                return (word as! Clanguage).name.lowercased().contains(searchText.lowercased())
            })
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
        return currentData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.settingSelectionTVCell.rawValue) as!
        SettingSelectionTVCell
        
        let singleData = currentData[indexPath.row]
        
        if singleData is Clanguage {
            cell.subtitleLabel.text = (singleData as! Clanguage).name
            cell.valueLabel.text = (singleData as! Clanguage).nativeName
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





