//
//  Location.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


struct Location : Codable {
    
    struct City : Codable {
        let code : String
        let geonamesID : Int32
        let name : String
        let state : String
        let country : String
        let location : Coordinates
        let timezone : String
        let currency : String
        
        private enum CodingKeys : String, CodingKey {
            case code
            case geonamesID = "geonamesID"
            case name
            case state
            case country
            case location
            case timezone
            case currency
        }
    }
    
    let city : City
    
    struct Airport : Codable {
        let code : String
        let name : String
        let cityCode : String
        let cityName : String
        let state : String
        let country : String
        let location : Coordinates
        let aircraftMovements : Int32
        let timezone : String
        
        private enum CodingKeys : String, CodingKey {
            case code
            case name
            case cityCode = "city_code"
            case cityName = "city_name"
            case state
            case country
            case location
            case aircraftMovements = "aircraft_movements"
            case timezone
        }
    }
    
    let airports : [Airport]
    
}
