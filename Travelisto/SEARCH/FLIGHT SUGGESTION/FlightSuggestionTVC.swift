//
//  FlightSuggestionTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/10/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FlightSuggestionTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }


}


//MARK: Row Height
extension FlightSuggestionTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let popularDestinationCellHeight = CGFloat(263)
        let dealsCellHeight = CGFloat(300)
        let defaultHeight = CGFloat(100)
        switch indexPath.row {
            case 0:
                return popularDestinationCellHeight
            case 1:
                return dealsCellHeight
            default:
                break
        }
        return defaultHeight
    }
    
}



//MARK: Data Source
extension FlightSuggestionTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.row {
            case 0:
                cell = tableView.dequeueReusableCell(withIdentifier: FlightSuggestionCell.popularDestinationCell.rawValue) as!
                PopularDestinationTVCell
                return cell
            case 1:
                cell = tableView.dequeueReusableCell(withIdentifier: FlightSuggestionCell.dealsTVCell.rawValue) as!
                DealsTVCell
                return cell
            default:
                break
        }
        return cell
    }
    
}
