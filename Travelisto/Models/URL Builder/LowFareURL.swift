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
    
    var base : String
    var apiKey : String
    
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
    
    /// Flight Inspiration Search
    var oneWay : Bool? {
        didSet {
            base = base + "&one-way=\(oneWay ?? false)"
        }
    }
    var duration : String? {
        didSet {
            base = base + "&duration&=\(duration ?? "")"
        }
    }
    
    var aggregationMode : String? {
        didSet {
            base = base + "&aggregation_mode&=\(aggregationMode ?? "")"
        }
    }
    
    
    
    
    
    func buildUlRL()-> String {
        return base
    }
    
    
    
    
    
}//End Class LowFareUrl