//
//  SearchCodeTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SearchCodeTVC: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate  {

    //Search bar
    var customSearch : UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Search Bar
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Where to?"
        customSearch = searchController
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            self.delayDisplaySearchBar()
        })
    }

    
    @IBAction func closeButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func delayDisplaySearchBar(){
        customSearch?.isActive = true
        customSearch?.becomeFirstResponder()
        customSearch?.definesPresentationContext = true
    }

}
