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
    
    let line1 : String
    let city : String
    let region : String
    let postalCode : String
    let country : String
    
    private enum CodingKeys : String, CodingKey {
        case line1
        case city
        case region
        case postalCode = "postal_code"
        case country
    }
    
    
}
