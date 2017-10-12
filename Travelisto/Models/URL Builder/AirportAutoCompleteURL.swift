//
//  AirportAutoComplete.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/12/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// This struct builds the URL for the
/// Airport AutoComplete Search. The fields
/// are same or the oned defined in the API
struct AirportAutoCompleteURL {
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://api.sandbox.amadeus.com/v1.2/airports/autocomplete?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    /// Search keyword that should represent the start
    /// of a word in a city or airport name. Eg Ban
    var term : String? {
        didSet {
            base.append("&term=\(term ?? "")")
        }
    }
    
    ///Identified a country based of a ISO 3166-1 alpha-2 code Eg US
    var country : String? {
        didSet {
            base.append("&country=\(country ?? "")")
        }
    }
    
    /// Boolean to include or not all airports, no matter their traffic rank.
    /// False by default, to only display relevant airports.
    var allAirports : Bool? {
        didSet {
            base.append("&all_airports=\(allAirports ?? false)")
        }
    }

    
}//End class AirportAutoCompleteURL
