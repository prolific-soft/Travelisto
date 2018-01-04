//
//  TutorialSlideView.swift
//  Travelisto
//
//  Created by Chidi Emeh on 1/3/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TutorialSlideView: UIView {

    @IBOutlet weak var tutorialImageView: UIImageView!
    @IBOutlet weak var tutorialDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        tutorialImageView.layer.cornerRadius = tutorialImageView.frame.height/2
        tutorialImageView.layer.masksToBounds = true
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    

}
