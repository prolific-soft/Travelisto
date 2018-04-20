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
        
        tableView.register(UINib(nibName: "FoodDescriptionTVCell", bundle: nil), forCellReuseIdentifier: TripOpenCells.foodDescriptionTVCell.rawValue)
    }

}


// MARK: - DATA SOURCE
extension TripOpenTVC  {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cityDescriptionCellHeight = CGFloat(164)
        let cityMapCellHeight = CGFloat(210)
        let topExperiencesCellHeight = CGFloat(231)
        let foodDescriptionCellHeight = CGFloat(173)
        let restuarantsCellHeight = CGFloat(234)
        
        switch indexPath.row {
        case 0:
            return UITableViewAutomaticDimension
        case 1:
            return cityMapCellHeight
        case 2:
            return topExperiencesCellHeight
        case 3:
            return foodDescriptionCellHeight
        case 4:
            return restuarantsCellHeight
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
        let rowNumber = 5
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
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripOpenCells.foodDescriptionTVCell.rawValue, for: indexPath) as! FoodDescriptionTVCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripOpenCells.restuarantsTVCell.rawValue, for: indexPath) as! RestuarantsTVCell
            return cell
        default:
            break
        }
        
        return cell
    }
}


//CollectionView Will Display
extension TripOpenTVC {

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell.tag == 1 {
            
            guard let restuarantTVCell = cell as? RestuarantsTVCell else  { return }
            let restuarantCollectionView = restuarantTVCell.restuarantCollectionView
            restuarantCollectionView?.dataSource = self
            restuarantCollectionView?.dataSource = self
            
        }
    }
    
}




//MARK: - Layouts
extension TripOpenTVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(161)
        let cellDefaultWidth = CGFloat(136)
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(2, 20, 2, 20)
        return inset
    }
    
}



//MARK: - Datasource
extension TripOpenTVC {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripOpenCells.restuarantsCVCell.rawValue, for: indexPath) as! RestuarantsCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
}



