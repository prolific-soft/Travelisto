//
//  HotelSuggestionTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/10/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HotelSuggestionTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}


//MARK: Row Height
extension HotelSuggestionTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let popularDestinationCellHeight = CGFloat(263)
        let dealsCellHeight = CGFloat(195)
        let defaultHeight = CGFloat(100)
        switch indexPath.row {
        case 0:
            return popularDestinationCellHeight
        case 1:
            return dealsCellHeight
        case 2:
            return popularDestinationCellHeight
        default:
            break
        }
        return defaultHeight
    }
    
}



//MARK: Data Source
extension HotelSuggestionTVC {
    
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
            cell = tableView.dequeueReusableCell(withIdentifier: FlightSuggestionCell.hotelPopularDestinationTVCell.rawValue) as!
            HotelPopularDestinationTVCell
            return cell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: FlightSuggestionCell.hotelDealsTVCell.rawValue) as!
            HotelDealsTVCell
            return cell
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: FlightSuggestionCell.hotelPopularDestinationTVCell.rawValue) as!
            HotelPopularDestinationTVCell
            return cell
        default:
            break
        }
        return cell
    }
    
}
