//
//  ExploreContentOpenTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ExploreContentOpenTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}


//MARK : Prepare for Segue
extension ExploreContentOpenTVC{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
}

//MARK: Row Height
extension ExploreContentOpenTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let exploreContentOpenCellHeight = CGFloat(122)
        return exploreContentOpenCellHeight
    }
    
}



//MARK: Data Source
extension ExploreContentOpenTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: ExploreCells.exploreContentOpenTVCell.rawValue) as!
        ExploreContentOpenTVCell
        return cell
    
    }
}

//MARK: - Load Data
extension ExploreContentOpenTVC {
    func loadData(){
        
    }
    
}
