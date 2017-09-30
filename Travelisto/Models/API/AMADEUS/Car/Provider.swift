//
//  Provider.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


/// A company object detailing the car rental company offering this rental.
struct Provider : Codable {
    
    /// The Amadeus 2-character company code of this car rental provider.
    let companyCode : String
    
    /// The long name of this car rental provider corresponding to the above code.
    let companyName : String
    
    private enum CodingKeys : String, CodingKey {
        case companyCode = "company_code"
        case companyName = "company_name"
    }
}

