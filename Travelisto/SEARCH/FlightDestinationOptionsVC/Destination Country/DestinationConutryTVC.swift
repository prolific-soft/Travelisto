//
//  DestinationConutryTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class DestinationConutryTVC: UITableViewController, UISearchBarDelegate,
UISearchControllerDelegate, UIViewControllerPreviewingDelegate {
    
    
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
        
        //3D Peek
        if( traitCollection.forceTouchCapability == .available){
            registerForPreviewing(with: self, sourceView: view)
        }
        
        //Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.definesPresentationContext = false
        searchController.searchBar.placeholder = "Search Airport Destination?"
        searchController.searchBar.tintColor = UIColor(red: 253/255, green: 87/255, blue: 57/255, alpha: 1)
        searchController.searchBar.setValue("Done", forKey: "_cancelButtonText")
        
       
    
        loadData() //Load from flight options instead. Causes delay in loading
        
    }
    
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - 3D Peek
extension DestinationConutryTVC {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView?.indexPathForRow(at: location) else { return nil }
        guard let cell = tableView.cellForRow(at: indexPath) else { return nil }
        
        let searchSB = UIStoryboard(name: "Search", bundle: nil)
        let detailVC = searchSB.instantiateViewController(withIdentifier: "DetailPeekVC") as! DetailPeekVC
        
        let dataToSend = filteredCodes[indexPath.row] as! Cairport
        detailVC.data = dataToSend
        
        detailVC.preferredContentSize = CGSize(width: 0.0, height: 500)
        
        previewingContext.sourceRect = cell.frame
        return detailVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        //show(viewControllerToCommit, sender: previewingContext)
    }
    
}


//MARK: - Search Filter
extension DestinationConutryTVC {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //Filter languages
        if codes != nil {
            if !searchText.isEmpty {
                filteredCodes = codes?.filter { airportCode in
                    let convertedAirport = airportCode as? Cairport
                    return (convertedAirport?.name?.lowercased().contains(searchText.lowercased()))!
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
extension DestinationConutryTVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
}


//MARK: Data Source
extension DestinationConutryTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.destinationCountryTVCell.rawValue) as!
        DestinationCountryTVCell
        
        if let loadedCodes = filteredCodes {
            let singleCode = loadedCodes[indexPath.row]
            cell.airport =  (singleCode as! Cairport)
            cell.countryLabel.text = (singleCode as! Cairport).name ?? " "
            cell.countryCode.text = (singleCode as! Cairport).code ?? " "
        }
        return cell
    }
    
}

/// MARK: - Navigation & Segue
extension DestinationConutryTVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}


//MARK: - Load Data
extension DestinationConutryTVC {
    func loadData(){
        
        //Load Currency before sending
        let airportfilePath = Bundle.main.path(forResource: "airports", ofType: "json")
        let airportUrl = URL(fileURLWithPath: airportfilePath!)
        
        do {
            let airportJSONCodes = try Data(contentsOf: airportUrl)
            let airportCodes = try JSONDecoder().decode([Cairport].self, from: airportJSONCodes)
             self.codes = airportCodes
        }catch let error as NSError {
            print("Error Loading Cairports : \(error)")
        }
    }
    
}



