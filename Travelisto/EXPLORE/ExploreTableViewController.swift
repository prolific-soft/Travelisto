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
    
    //TableView cell
    var tripToCell : TripToTVCell!
    var relaxationCell : RelaxationTVCell!
    
    
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


//MARK: WILL DISPLAY
extension ExploreTableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            guard let cell = cell as? TripToTVCell else { return }
            let tripToCollectionView = cell.tripToCollectionView
            tripToCollectionView?.delegate = self
            tripToCollectionView?.dataSource = self
        }else {
            guard let cell = cell as? RelaxationTVCell else { return }
            let relaxationCollectionView = cell.relaxationCollectionView
            relaxationCollectionView?.delegate = self
            relaxationCollectionView?.dataSource = self
        }
    }
    
}



//MARK: - CollectionView Delegate & Datasource
extension ExploreTableViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        //CollectionView Tag 1 is tripToCollectionView
        //CollectionView Tag 2 is tripToCollectionView
        if collectionView.tag == 1 {
            return 30
        }else {
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
                let cellDefaultHeight = CGFloat(200)
                let cellDefaultWidth = CGFloat(335)
                let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
                return size
        }else {
            let cellDefaultHeight = CGFloat(168)
            let cellDefaultWidth = CGFloat(135)
            let size = CGSize(width: cellDefaultWidth, height: cellDefaultHeight)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView.tag == 1 {
            let inset = UIEdgeInsetsMake(20, 20, 20, 0)
            return inset
        }else {
            let inset = UIEdgeInsetsMake(2, 20, 2, 0)
            return inset
        }
    }
    
}



//MARK: - Datasource
extension ExploreTableViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 1 ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCells.tripToCVCell.rawValue, for: indexPath) as! TripToCVCell
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCells.relaxationCVCell.rawValue, for: indexPath) as! RelaxationCVCell
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Perform Segue
    }
    
    
}




























