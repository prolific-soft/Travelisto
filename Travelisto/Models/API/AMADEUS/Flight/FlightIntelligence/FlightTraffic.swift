//
//  FlightTraffic.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


struct FlightTraffic : Codable {
    
    struct Result : Codable {
        let destination : String
        let period : String
        let flights : Int
        let travelers : Int
    }
    
    let results : [Result]
    
}
