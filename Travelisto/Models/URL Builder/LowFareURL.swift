//
//  LowFareURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/2/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Constructs a URL for a given set of parameters

struct LowFareURL {
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://api.sandbox.amadeus.com/v1.2/flights/low-fare-search?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    /// Flight Low-Fare Search
    var origin : String? {
        didSet {
            base.append("&origin=\(origin ?? "")")
        }
    }
    var destination : String? {
        didSet {
            base.append("&destination=\(destination ?? "")")
        }
    }
    var departureDate : String? {
        didSet {
            base.append("&departure_date=\(departureDate ?? "")")
        }
    }
    
    var returnDate : String? {
        didSet {
             base.append("&return_date=\(returnDate ?? "")")
        }
    }
    var adults : Int? {
        didSet {
            base.append("&adults=\(adults ?? 1)")
        }
    }
    var children : Int? {
        didSet {
            base = base + "&children=\(children ?? 0)"
        }
    }
    var infants : Int? {
        didSet {
            base = base + "&infants=\(infants ?? 0)"
        }
    }
    var nonstop : Bool? {
        didSet {
           base = base + "&nonstop=\(nonstop!)"
        }
    }
    var maxPrice : Int? {
        didSet {
           base = base + "&max_price=\(maxPrice ?? 0)"
        }
    }
    var currency : String? {
        didSet {
            base = base + "&currency=\(currency ?? "")"
        }
    }
    var travelClass : String? {
        didSet {
          base = base + "&travel_class=\(travelClass ?? "")"
        }
    }
    var numberOfResults : Int? {
        didSet {
           base = base + "&number_of_results&=\(numberOfResults ?? 1)"
        }
    }

    
    func buildUlRL()-> String {
        return base
    }
    
    
    
    
    
}//End Class LowFareUrl
