//
//  AmenityTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/21/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class AmenityTVC: UITableViewController, UISearchBarDelegate,
UISearchControllerDelegate {

    
    //Data
    var dataCount = 0
    var filteredCodes : [Codable]!
    var codes : [Codable]?{
        didSet{
            filteredCodes = codes
            dataCount = filteredCodes.count
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.definesPresentationContext = false
        searchController.searchBar.placeholder = "Search Amenities?"
        searchController.searchBar.tintColor = UIColor(red: 253/255, green: 87/255, blue: 57/255, alpha: 1)
        searchController.searchBar.setValue("Done", forKey: "_cancelButtonText")
        
        
        
        loadData() //Load from filters options instead. Causes delay in loading
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}




//MARK: - Search Filter
extension AmenityTVC {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //Filter languages
        if codes != nil {
            if !searchText.isEmpty {
                filteredCodes = codes?.filter { amenity in
                    let convertedAmenity = amenity as? Camenity
                    return (convertedAmenity?.name.lowercased().contains(searchText.lowercased()))!
                }
                dataCount = (filteredCodes?.count)!
            } else {
                filteredCodes = codes
                dataCount = (filteredCodes?.count)!
            }
            tableView.reloadData()
        }
    }
    
}


//MARK: Row Height
extension AmenityTVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 61
    }
}


//MARK: Data Source
extension AmenityTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.amenityTVCell.rawValue) as!
        AmenityTVCell
        
        if let loadedCodes = filteredCodes {
            let singleCode = loadedCodes[indexPath.row]
            cell.amenity =  (singleCode as! Camenity)
            cell.countryLabel.text = (singleCode as! Camenity).name
            let imageName = (singleCode as! Camenity).image
            cell.countryIcon.image = UIImage(named: imageName)
        }
        
        return cell
    }
    
}

/// MARK: - Navigation & Segue
extension AmenityTVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}


//MARK: - Load Data
extension AmenityTVC {
    func loadData(){
        
        //Load Currency before sending
        let amenityFilePath = Bundle.main.path(forResource: "amenity", ofType: "json")
        let amnityUrl = URL(fileURLWithPath: amenityFilePath!)
        
        do {
            let amenityJSONCodes = try Data(contentsOf: amnityUrl)
            let amenityCodes = try JSONDecoder().decode([Camenity].self, from: amenityJSONCodes)
            self.codes = amenityCodes
        }catch let error as NSError {
            print("Error Loading Cairports : \(error)")
        }
    }
    
}




