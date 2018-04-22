//
//  AmenityTVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/21/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class AmenityTVCell: UITableViewCell {

    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryIcon: UIImageView!
    
    var amenity : Camenity?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
