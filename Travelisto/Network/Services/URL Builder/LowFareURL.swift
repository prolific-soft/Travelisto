//
//  LowFareURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/2/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Construct a URL for a given set of parameters


struct LowFareURL {
    
    var apiKey : String?
    var origin : String?
    var destination : String?
    var departureDate : String?
    var returnDate : String?
    var adults : Int?
    var children : Int?
    var infants : Int?
    var nonstop : Bool?
    var maxPrice : Int?
    var currency : String?
    var travelClass : String?
    var numberOfResults : Int?
    
    
    func buildUlRL()-> String {
        
        var base = "https://api.sandbox.amadeus.com/v1.2/flights/low-fare-search?"
        
        if apiKey != nil {
             base.append("apiKey=\(apiKey ?? "")")
        }
        if origin != nil {
             base.append("&origin=\(origin ?? "")")
        }
        if destination != nil {
            base.append("&destination=\(destination ?? "")")
        }
        if departureDate != nil {
            base.append("&departure_date=\(departureDate ?? "")")
        }
        if returnDate != nil {
            base.append("&return_date=\(returnDate ?? "")")
        }
        if adults != nil {
            base.append("&return_date=\(adults ?? 1)") 
        }
        if children != nil {
            base = base + "&return_date=\(children ?? 0)"
        }
        if infants != nil {
            base = base + "&return_date=\(infants ?? 0)"
        }
        if nonstop != nil {
            base = base + "&nonstop=\(nonstop!)"
        }
        if maxPrice != nil {
            base = base + "&max_price=\(maxPrice ?? 0)"
        }
        if currency != nil {
            base = base + "&currency=\(currency ?? "")"
        }
        if travelClass != nil {
            base = base + "&travel_class=\(travelClass ?? "")"
        }
        if numberOfResults != nil {
            base = base + "&travel_class=\(numberOfResults ?? 1)"
        }
        return base
    }
    
}
