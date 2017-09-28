//
//  HotelAirports.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/28/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The hotels around a given airport

struct HotelAirports : Codable {
    
    struct Hotel : Codable {
        let propertyCode : String
        let propertyName : String
        let marketingText : String
        let location : Coordinates
        let address : Address
        
        struct Amount : Codable {
            let amount : Double
            let currency : String
        }
        
        let totalPrices : Amount
        let minDailyRate : Amount
        
        struct Contact : Codable {
            let type : String
            let detail : String
        }
        
        let contacts : [Contact]
        
        struct Amenity : Codable {
            let amenity : String
            let otaCode : String
            let description : String
            
            private enum CodingKeys : String, CodingKey {
                case amenity
                case otaCode = "ota_code"
                case description
            }
        }
        
        let amenities : [Amenity]
        let awards : [Any]
        let images : [Any]
        let rooms : [Any]
        let links : Any
    }
    
    private enum CodingKeys: String, CodingKey {
        
        case propertyCode = "property_code"
        case propertyName = "property_name"
        case marketingText = "marketing_text"
        case location
        case address
        case totalPrices = "total_price"
        case minDailyRate
        case contacts
        case amenities
        case awards
        case images
        case rooms
        case links
    }
    
    //let results : [Any]
}



