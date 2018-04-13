//
//  SettingSelectionTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/12/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SettingSelectionTVCell: UITableViewCell {

    //UI Properties
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var accessoryIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

}
