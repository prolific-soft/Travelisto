//
//  CustomTextField.swift
//  Travelisto
//
//  Created by Chidi Emeh on 1/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        setupViewProperties()
    }
    
    func setupViewProperties(){
        self.layer.cornerRadius = 8
        let lightGray = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes:[NSAttributedStringKey.foregroundColor : lightGray])
        
        self.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }
    
}
