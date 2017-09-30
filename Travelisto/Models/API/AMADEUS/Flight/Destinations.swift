//
//  Destination.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


//The destination Airport with departure
//and return date, with price and type of
//airline for a given search with current
//location airport as the starting point
//
//Date must be decoded to .iso8601
//Eg.
// let decoder = JSONDecoder()
// decoder.dateDecodingStrategy = .iso8601
// let destination = decoder.decode(Destination.self, from: jsonData)

struct Destinations : Codable {
    let origin : String
    let currency : String
    
    struct Destination: Codable {
        let destination : String
        let departureDate : Date
        let returnDate : Date
        let price : Double
        let airline : String

        enum CodingKeys : String, CodingKey {
            case destination
            case departureDate = "departure_date"
            case returnDate = "return_date"
            case price
            case airline
        }
    }
    
    let results : [Destination]
    
}






















