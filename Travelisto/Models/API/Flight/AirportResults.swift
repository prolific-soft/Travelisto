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

//Returns a list of Nearest Airports for a given
//latitude and longitude
struct NearestRelevantAirport {
    struct Airport : Codable {
        let airport : String
        let airportName : String
        let city : String
        let cityName : String
        let distance : Int
        
        struct Coordinates : Codable {
            let latitiude : Double
            let longitude : Double
        }
        
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
















