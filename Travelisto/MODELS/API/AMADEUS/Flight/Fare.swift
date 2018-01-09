//
//  Fare.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The amount charges for a given destination
//Includes Price for adult and may or may not
//include price per Child or infant depending on
//Search
struct Fare: Codable {
    
    let totalPrice : String?
    
    struct FareAmount: Codable {
        let totalFare : String?
        let tax : String?
        private enum CodingKeys : String, CodingKey{
            case totalFare = "total_fare"
            case tax
        }
    }
    
    let pricePerAdult : FareAmount?
    let pricePerChild : FareAmount?
    let pricePerInfant : FareAmount?
    
    struct Restriction : Codable {
        let refundable : Bool
        let changePenalties : Bool
        private enum CodingKeys : String, CodingKey {
            case refundable
            case changePenalties = "change_penalties"
        }
    }
    
    let restrictions : Restriction
    
    private enum CodingKeys : String, CodingKey{
        case totalPrice = "total_price"
        case pricePerAdult = "price_per_adult"
        case pricePerChild = "price_per_child"
        case pricePerInfant = "price_per_infant"
        case restrictions
    }
    
}
