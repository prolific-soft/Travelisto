//
//  LowPriceFlight.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The result of a search for flight
//based on destination and lowest price

struct LowPriceFlight: Codable {
    
    let currency : String
    
    struct ItineraryAndFare : Codable {

        struct Outbounds : Codable {
            let outbound : Outbound
            let inbound : Outbound?
        }
        
        let itineraries : [Outbounds]
        let fare : Fare
    
    }
    
    
    let results : [ItineraryAndFare]
    
    
    
    
}
