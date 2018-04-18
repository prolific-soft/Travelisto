//
//  CalendarPickerCVCell.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/17/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import JTAppleCalendar

class CalendarPickerCVCell : JTAppleCell {
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //selectedView.layer.cornerRadius = selectedView.layer.frame.height/2
    }
    
}
