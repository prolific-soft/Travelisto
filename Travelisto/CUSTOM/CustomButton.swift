//
//  CustomButton.swift
//  Travelisto
//
//  Created by Chidi Emeh on 1/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        setUp()
    }

    
    func setUp(){
        let backgroundColor = UIColor(red: 253/255, green: 87/255, blue: 57/255, alpha: 1)
        self.layer.backgroundColor = backgroundColor.cgColor
        self.layer.frame.size = CGSize(width: 335, height: 56)
        self.layer.cornerRadius = self.layer.frame.height/2
    }
}
