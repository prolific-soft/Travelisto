//
//  TopFlights.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

struct TopFlights : Codable {
    let origin : String
    let period : Date
    
    struct Result : Codable {
        
        let international: [String]
        let destination : String
        let flights : Int
        let travelers : Int
    }
    
    let results : [Result]
}
