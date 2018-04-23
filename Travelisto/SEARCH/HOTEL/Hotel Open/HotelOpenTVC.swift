//
//  HotelOpenTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/22/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HotelOpenTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}


//Register cell Nibs
extension HotelOpenTVC {
    
    private func registerXibs(){
        
    }
    
}


// MARK: - DATA SOURCE
extension HotelOpenTVC  {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let hotelOneTVCellHeight = CGFloat(61)
        let hotelFiveCellHeight = CGFloat(190)
        let topExperiencesCellHeight = CGFloat(231)
        let foodDescriptionCellHeight = CGFloat(173)
        let restuarantsCellHeight = CGFloat(234)
        
        switch indexPath.row {
        case 0:
            return hotelOneTVCellHeight
        case 1:
            return hotelOneTVCellHeight
        case 2:
            return hotelOneTVCellHeight
        case 3:
            return UITableViewAutomaticDimension
        case 4:
            return hotelFiveCellHeight
        default:
            break
        }
        
        return hotelOneTVCellHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber = 6
        return rowNumber
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelOpenCells.hotelOneTVCell.rawValue, for: indexPath) as! HotelOneTVCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelOpenCells.hotelTwoTVCell.rawValue, for: indexPath) as! HotelTwoTVCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelOpenCells.hotelThreeTVCell.rawValue, for: indexPath) as! HotelThreeTVCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelOpenCells.hotelFourTVCell.rawValue, for: indexPath) as! HotelFourTVCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: HotelOpenCells.hotelFiveTVCell.rawValue, for: indexPath) as! HotelFiveTVCell
            return cell
        default:
            break
        }
        
        return cell
    }
}






