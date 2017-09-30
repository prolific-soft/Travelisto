//
//  VehicleInfo.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Vehicle info object containing more information about the type of vehicle on offer.
struct VehicleInfo : Codable {
    
    /// The 4 letter ACRISS code that defines the properties of vehicle being rented.
    let acrissCode : String
    
    /// The decoded ACRISS transmission type, to let you know if this vehicle is Automatic or Manual Transmission (stick-shift).
    let transmission : String
    
    /// The decoded ACRISS fuel type, to let you know if this vehicle is hybrid, electric, etc.
    let fuel : String
    
    /// The decoded ACRISS air_conditioning information, to let you know if this vehicle has air conditioning, as a true/false boolean.
    let airConditioning : Bool
    
    /// The decoded ACRISS vehicle category (For example: Economy, Luxury, Standard).
    let category : String
    
    /// The decoded ACRISS vehicle type, to let you know what kind of vehicle this is (For example: Van, SUV, Pickup).
    let type : String
    
    private enum CodingKeys : String, CodingKey {
        case acrissCode = "acriss_code"
        case transmission
        case fuel
        case airConditioning = "air_conditioning"
        case category
        case type
    }
}

