//
//  TripOpenTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TripOpenTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        registerXibs()
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

//Register cell Nibs
extension TripOpenTVC {
    
    private func registerXibs(){
        tableView.register(UINib(nibName: "CityDescriptionTVCell", bundle: nil), forCellReuseIdentifier: TripOpenCells.cityDescriptionTVCell.rawValue)
        
        tableView.register(UINib(nibName: "TopExperiencesTVCell", bundle: nil), forCellReuseIdentifier: TripOpenCells.topExperiencesTVCell.rawValue)
    }
    
    
}


// MARK: - DATA SOURCE
extension TripOpenTVC  {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cityDescriptionCellHeight = CGFloat(164)
        let cityMapCellHeight = CGFloat(210)
        let topExperiencesCellHeight = CGFloat(231)
        
        switch indexPath.row {
        case 0:
            return UITableViewAutomaticDimension
        case 1:
            return cityMapCellHeight
        case 2:
            return topExperiencesCellHeight
        default:
            break
        }
        
        return cityDescriptionCellHeight
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sectionNumber = 1
        return sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowNumber = 3
        return rowNumber
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripOpenCells.cityDescriptionTVCell.rawValue, for: indexPath) as! CityDescriptionTVCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripOpenCells.cityMapTVCell.rawValue, for: indexPath) as! CityMapTVCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripOpenCells.topExperiencesTVCell.rawValue, for: indexPath) as! TopExperiencesTVCell
            return cell
        default:
            break
        }
        
        return cell
    }
}


//Register cell Nibs
extension TripOpenTVC {

    
}


