//
//  AirportAutoComplete.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Finds the airports code in a given city
struct AirportAutoComplete : Codable {
    
    struct AirportCode: Codable {
        let value : String
        let label : String
    }
    
    let result : [AirportCode]
    
}
















