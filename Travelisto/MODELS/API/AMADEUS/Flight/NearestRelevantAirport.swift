//
//  NearestRelevantAirport.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


//Returns a list of Nearest Airports for a given
//latitude and longitude
struct NearestRelevantAirport : Codable {
    
    struct Airport : Codable {
        let airport : String
        let airportName : String
        let city : String
        let cityName : String
        let distance : Int
        
        let location : Coordinates
        let aircraftMovements : Int32
        let timezone : String
        
        private enum CodingKeys : String, CodingKey {
            case airport
            case airportName = "airport_name"
            case city
            case cityName = "city_name"
            case distance
            case location
            case aircraftMovements = "aircraft_movements"
            case timezone
        }
        
    }
    let result : [Airport]
}
