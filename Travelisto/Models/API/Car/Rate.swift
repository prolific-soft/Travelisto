//
//  Rate.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Contains the type and amount
struct Rate : Codable {
    
    /// The type or applicability period of rate being applied. For example: DAILY, WEEKLY, WEEKEND.
    let type : String
    
    /// The overall cost of the rate being applied as a price object.
    let price : Amount
}
