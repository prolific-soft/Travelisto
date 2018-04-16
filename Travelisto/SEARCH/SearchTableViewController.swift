//
//  SearchTableViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/10/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    //UI Properties
    @IBOutlet weak var searchSegmentedControl: UISegmentedControl!
    var customSearch : UISearchController?

    //var data = [[""], [""]]()
    var searchCodes : [[Codable]]!
    var position : Int!
    var dummyCount = [["one", "two", "three", "four"], [" one", "two"]]
 
    
    //Refresh Control
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        position = 0
        tableView.refreshControl = refresher
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }

    @IBAction func searchIconTapped(_ sender: UIBarButtonItem) {
         self.performSegue(withIdentifier: SearchSegue.toSearchCodeTVC.rawValue, sender: nil)
    }
    
    @objc
    private func requestData(){
        refreshControl?.beginRefreshing()
        print("Refreshing SearchTableViewController ....")
        //Reload or refetch data
        refreshControl?.endRefreshing()
    }
    
    @IBAction func searchSegmentedControlSwitched(_ sender: UISegmentedControl) {
        position = sender.selectedSegmentIndex
        tableView.reloadData()
    }

    
}

//MARK : Prepare for Segue
extension SearchTableViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SearchSegue.toSearchCodeTVC.rawValue {
            if let searchCodeTVC = segue.destination as? SearchCodeTVC {
                let codesToSend = searchCodes[position]
                searchCodeTVC.codes = codesToSend
            }
        }
        
    }
}

//MARK: Row Height
extension SearchTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let destinationCellHeight = CGFloat(263), dealsCellHeight = CGFloat(195),
            defaultHeight = CGFloat(100)
        switch indexPath.row {
        case 0:
            return destinationCellHeight
        case 1:
            return dealsCellHeight
        case 2:
            return destinationCellHeight
        default:
            break
        }
        return defaultHeight
    }
    
}



//MARK: Data Source
extension SearchTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3  //data[position].count to be used in TVCell
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.destinationTVCell.rawValue) as!
            DestinationTVCell
            cell.dummyDataCount = dummyCount[position].count
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.dealsTVCell.rawValue) as!
            DealsTVCell
            cell.dummyDataCount = dummyCount[position].count
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.destinationTVCell.rawValue) as!
            DestinationTVCell
            cell.dummyDataCount = dummyCount[position].count
            return cell
        default:
            break
        }
        return cell
    }
}

//MARK: - Load Data
extension SearchTableViewController {
    func loadData(){
        
        //Load Currency before sending
        let airportfilePath = Bundle.main.path(forResource: "airports", ofType: "json")
        let airportUrl = URL(fileURLWithPath: airportfilePath!)
        
        do {
            let airportJSONCodes = try Data(contentsOf: airportUrl)
            let airportCodes = try JSONDecoder().decode([Cairport].self, from: airportJSONCodes)
            let codeCopy = airportCodes
            searchCodes = [airportCodes, codeCopy]
        }catch let error as NSError {
            print("Error Loading Cairports : \(error)")
        }
    }
    
}

