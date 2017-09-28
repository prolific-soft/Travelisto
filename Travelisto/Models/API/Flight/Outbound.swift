//
//  Outbound.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//List of outbound flight to a
//specific location

struct Outbound : Codable {
    
    struct Flight: Codable {
        let departsAt : Date
        let arrivesAt : Date
        
        struct Origin : Codable {
            let airport : String
            let terminal : String
        }
        
        let origin : Origin
        let destination : Origin
        let marketingAirline : String
        let operatingAirline : String
        let flightNumber : String
        let aircraft : String
        
        struct BookingInfo : Codable {
            let travelClass : String
            let bookingCode : String
            let seatsRemaining : Int
            
            private enum CodingKeys : String, CodingKey {
                case travelClass = "travel_class"
                case bookingCode = "booking_code"
                case seatsRemaining = "seats_remaining"
            }
        }
        
        let bookingInfo : BookingInfo
        
        private enum CodingKeys : String, CodingKey {
            case departsAt = "departs_at"
            case arrivesAt = "arrives_at"
            case origin
            case destination
            case marketingAirline = "marketing_airline"
            case operatingAirline = "operating_airline"
            case flightNumber = "flight_number"
            case aircraft
            case bookingInfo = "booking_info"
        }
    }
    
   let flights : [Flight]
    
    
    
    
}
