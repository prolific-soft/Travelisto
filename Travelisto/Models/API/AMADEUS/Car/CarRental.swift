//
//  CarAirportSearch.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

// Search for a car rental for a given location. This
// struct models the result returned as defined in the API

struct CarRental : Codable {
    
    struct Result : Codable {
        
        let provider : Provider
        
        /// This car rental company's approximate geolocation as a location object. The exact quality of this parameter depends on the provider but it's usually quite accurate.
        let branchID : String
        
        /// holds the Coordinates
        let location : Coordinates
        
        /// This car rental company's airport IATA code, if it is located at an airport.
        let airport : String
        
        /// hols the address
        let address : Address
        
        /// An array of vehicle objects giving further details about each of the vehicles offered by this car rental provider.
        let cars : [Car]
        
        private enum CodingKeys : String, CodingKey {
            case provider
            case branchID = "branch_id"
            case location
            case airport
            case address
            case cars
        }
    }
    
    
    /// The array of search result objects, sorted by price. The length of the array will correspond to the number_of_results parameter used in the input.
    let result : [Result]?
    
    
}// End CarRental
