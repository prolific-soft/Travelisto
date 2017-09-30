//
//  Car.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

// Car as defined in the API

struct Car : Codable {
    
    let vehicleInfo : VehicleInfo
    
    /// An array of rate objects to let you know what rates will be applied during the duration of the car rental requested. These rates are generally not inclusive of tax and are used by the car rental company to compute the total cost at the end of the rental period.
    let rate : [Rate]
    
    /// An image objects to give an indication of what to expect when renting this vehicle.
    let images : [Image]
    
    /// The estimated total cost of the rental given the rental period and location provided, including all mandatory taxes and charges, and using a default set of rental options and restrictions defined by the car company, as a Price object.
    let estimatedTotal : Amount
    
    private enum CodingKeys : String, CodingKey {
        case vehicleInfo = "vehicle_info"
        case rate
        case images
        case estimatedTotal = "estimated_total"
    }
    
    

    
} // End Car
