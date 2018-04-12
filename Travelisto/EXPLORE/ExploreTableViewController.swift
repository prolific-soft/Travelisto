//
//  ExploreTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ExploreTableViewController : UITableViewController {

    
    
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
        print("Refreshing ExploreTableViewController ....")

        refreshControl?.endRefreshing()
    }
    
}



//MARK: Row Height
extension ExploreTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tripToCellHeight = CGFloat(250)
        let relaxationCellHeight = CGFloat(233)
        let hikingCellHeight = CGFloat(200)
        switch indexPath.row {
        case 0:
            return tripToCellHeight
        case 1:
            return relaxationCellHeight
        case 2:
            return relaxationCellHeight
        default:
            break
        }
        return hikingCellHeight
    }
    
}



//MARK: Data Source
extension ExploreTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: ExploreCells.tripToTVCell.rawValue) as!
            TripToTVCell
            return cell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: ExploreCells.relaxationTVCell.rawValue) as!
            RelaxationTVCell
            return cell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: ExploreCells.relaxationTVCell.rawValue) as!
            RelaxationTVCell
            return cell
        default:
            break
        }
        return cell
    }
    
}
