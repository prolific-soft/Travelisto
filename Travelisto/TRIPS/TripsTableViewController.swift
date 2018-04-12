//
//  TripsTableViewController.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {
    
    //Properties
    let sections = ["Past Trips", "Recent"]
    
    
    
    //Refresh Control
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let searchController = UISearchController(searchResultsController: nil)
        // navigationItem.searchController = searchController
        tableView.refreshControl = refresher
        
    }
    
    @objc
    private func requestData(){
        refreshControl?.beginRefreshing()
        print("Refreshing TripsTableViewController ....")
        refreshControl?.endRefreshing()
    }
    
}


///MARK: - Header View
extension TripsTableViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tripHeaderView = Bundle.main.loadNibNamed( TripsCells.tripHeaderView.rawValue, owner: self, options: nil)?.first as! TripHeaderView
        tripHeaderView.headerLabel.text = section == 0 ? sections[section] : sections[section]
        return tripHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let defaultHeaderHeight = CGFloat(39)
        return defaultHeaderHeight
    }
}



//MARK: Row Height
extension TripsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tripsCellHeight = CGFloat(161)
        return tripsCellHeight
    }
    
}



//MARK: Data Source
extension TripsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        cell = tableView.dequeueReusableCell(withIdentifier: TripsCells.tripsTVCell.rawValue) as!
        TripsTVCell
        return cell
    }
    
}

