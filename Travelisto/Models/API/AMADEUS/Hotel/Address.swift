//
//  Address.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/28/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The Address of a Hotel
struct Address : Codable {
    ///The first line of the hotel's address. Generally represents the hotel's basic street address.
    let line1 : String
    
    /// The town or city in which hotel is located.
    let city : String
    
    /// The state or region code in which the hotel is located.
    let region : String
    
    /// The postal or zip code of this address.
    let postalCode : String
    
    /// The ISO 3166-1 alpha-2 country code of this address.
    let country : String
    
    private enum CodingKeys : String, CodingKey {
        case line1
        case city
        case region
        case postalCode = "postal_code"
        case country
    }
    
    
}
