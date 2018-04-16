//
//  SearchCodeTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SearchCodeTVC: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UIViewControllerPreviewingDelegate {

    //Data
    var dataCount = 0
    var filteredCodes : [Codable]!
    var codes : [Codable]?{
        didSet{
           print("Codes to send was set ++++++++++++++")
            filteredCodes = codes
            dataCount = filteredCodes.count
        }
    }

    
    //Search bar
    var customSearch : UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //3D Peek and Pop
        if( traitCollection.forceTouchCapability == .available){
            registerForPreviewing(with: self, sourceView: view)
        }

        //Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Where to?"
        searchController.searchBar.tintColor = UIColor(red: 253/255, green: 87/255, blue: 57/255, alpha: 1)
        customSearch = searchController
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            self.delayDisplaySearchBar()
        })
    }

    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func delayDisplaySearchBar(){
        customSearch?.isActive = true
        customSearch?.becomeFirstResponder()
        //customSearch?.definesPresentationContext = true
    }

}

//MARK: - 3D Peek
extension SearchCodeTVC {
    
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
extension SearchCodeTVC {
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
extension SearchCodeTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
}



//MARK: Data Source
extension SearchCodeTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
//    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
//        <#code#>
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.searchCodeTVCell.rawValue) as!
        SearchCodeTVCell
        
        if let loadedCodes = filteredCodes {
            let singleCode = loadedCodes[indexPath.row]
            cell.countryLabel.text = (singleCode as! Cairport).name ?? " "
            cell.countryCode.text = (singleCode as! Cairport).code ?? " "
        }
        return cell
    }
    
}

/// MARK: - Navigation & Segue
extension SearchCodeTVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    
}







