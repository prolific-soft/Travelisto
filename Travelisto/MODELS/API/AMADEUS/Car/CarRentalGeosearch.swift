//
//  CarRentalGeosearch.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

struct CarRentalGeosearch : Codable {
    
    struct Result : Codable {
        let provider : Provider
        let location : Coordinates?
        let address : Address?
        
        struct Vehicle : Codable {
            let vehicleInfo : VehicleInfo
            
            struct Rate : Codable {
                let type : String
                let price : Amount
            }
            
            let rates : [Rate]
            let images : Image?
            let estimatedTotal : Amount
            
            private enum CodingKeys : String, CodingKey {
                case vehicleInfo = "vehicle_info"
                case rates
                case images
                case estimatedTotal = "estimated_total"
            }
        }
        
        let cars : [Vehicle]
    }
    
    let results : [Result]
}
