//
//  Amount.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

struct Amount : Codable {
    /// Total amount for the stay period. For example: $194.99.
    let amount : Double
    
    /// Currency code of the total amount. For example: "USD".
    let currency : String
}
