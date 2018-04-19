//
//  FlightOffersTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class FlightOffersTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
}



//MARK: Row Height
extension FlightOffersTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let datesCellHeight = CGFloat(80)
        let flightOffersCellHeight = CGFloat(150)
        
        switch indexPath.row {
        case 0:
            return datesCellHeight
        default:
            return flightOffersCellHeight
        }
    }
}



//MARK: Data Source
extension FlightOffersTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.dateResultsTVCell.rawValue) as!
            DateResultsTVCell
        
        default:
             cell = tableView.dequeueReusableCell(withIdentifier: SearchCells.flightOfferTVCell.rawValue) as!
            FlightOfferTVCell
        }

        return cell
    }
    
}


/// MARK: - Navigation & Segue
extension FlightOffersTVC {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
    }
}



//MARK: Set CollectionView
extension FlightOffersTVC {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            guard let cell = cell as? DateResultsTVCell else {return}
            let dateResultsCollectionView = cell.dateResultsCollectionView
            dateResultsCollectionView?.delegate = self
            dateResultsCollectionView?.dataSource = self
        }
        
    }
}


//MARK: CollectionView Delegate
extension FlightOffersTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDefaultHeight = CGFloat(37)
        let cellDefaultWidth = CGFloat(95) //collectionView.frame.width/3
        let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsetsMake(5, 20, 5, 20)
        return inset
    }
    
}


//MARK: CollectionView & Datasource
extension FlightOffersTVC {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCells.dateResultsCVCell.rawValue, for: indexPath) as! DateResultsCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}










