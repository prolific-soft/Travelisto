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
    @IBOutlet weak var flightSuggestionContaineView: UIView!
    @IBOutlet weak var hotelSuggestionContainerView: UIView!
    
    //Class Properties
    private var flightSuggestionTVC : UITableViewController?
    private var hotelSuggestionTVC : UITableViewController?
    
    //Refresh Control
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .darkGray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        tableView.refreshControl = refresher
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //loadTVC()
    }

    
    @objc
    private func requestData(){
        refreshControl?.beginRefreshing()
        print("Refreshing SearchTableViewController ....")
        flightSuggestionTVC?.tableView.reloadData()
        hotelSuggestionTVC?.tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    //Search Type tapped
    @IBAction func searchSegmentedControlSwitched(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            flightSuggestionContaineView.isHidden = false
            hotelSuggestionContainerView.isHidden = true
        case 1:
            flightSuggestionContaineView.isHidden = true
            hotelSuggestionContainerView.isHidden = false
        default:
            break
        }
    }

    
    //Load Flight and Hotel TVC
    private func loadTVC(){
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
         flightSuggestionTVC = searchStoryboard.instantiateViewController(withIdentifier: "FlightSuggestionTVC") as! FlightSuggestionTVC
        flightSuggestionTVC?.tableView.reloadData()
        hotelSuggestionTVC = searchStoryboard.instantiateViewController(withIdentifier: "HotelSuggestionTVC") as! HotelSuggestionTVC
        hotelSuggestionTVC?.tableView.reloadData()
    }
    
    
    

}
