//
//  InspirationURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/11/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

struct InspirationURL {
    
    var base : String
    var apiKey : String
    
    init(){
        self.base = "https://api.sandbox.amadeus.com/v1.2/flights/inspiration-search?"
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
    var oneWay : Bool? {
        didSet {
            base.append("&one-way=\(oneWay ?? false)")
        }
    }
    var duration : String? {
        didSet {
            base.append("&duration=\(duration ?? "")")
        }
    }
    var direct : Bool? {
        didSet {
            base.append("&direct=\(direct ?? false)")
        }
    }
    
    var maxPrice : String? {
        didSet {
           base.append("&max_price=\(maxPrice ?? "")")
        }
    }
    
    var aggregationMode : String? {
        didSet {
            base = base + "&aggregation_mode=\(aggregationMode ?? "")"
        }
    }
    
    
    func buildUlRL()-> String {
        return base
    }
    
    
}
