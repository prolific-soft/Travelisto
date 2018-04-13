//
//  PrivacyTVC.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class PrivacyTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    

}


//MARK: Row Height
extension PrivacyTVC {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
}



//MARK: Data Source
extension PrivacyTVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCells.privacyTVCell.rawValue) as!
        PrivacyTVCell
        return cell
    }
    
}
