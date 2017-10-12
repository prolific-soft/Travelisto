//
//  InspirationURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/11/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// The URL builder struct for both Flight
/// Inspiration and flight extensive search.
/// This class contains the paramenter that are
/// required by the API. The parameters will be
/// supplied by the user from the UI


struct InspirationURL {
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://api.sandbox.amadeus.com/v1.2/flights/inspiration-search?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    //Should be initialized with "extensive-search"
    init(extensiveSearch : String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/flights/\(extensiveSearch)?"
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
