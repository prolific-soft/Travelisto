//
//  AirportAreaURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/12/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// This builds the URL to find the Nearest Relevant
/// Airports and the Airport Location Information Search
/// Defined in the API

struct AirportAreaURL {
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    ///Provided with "nearest-relevant"
    init(nearestRelevant: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/airports/\(nearestRelevant)?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    //IATA Code EG. PAR (Paris), CMH (Columbus)
    init(IATALocationCode: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/location/\(IATALocationCode)?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    /// Latitude location to be at the center of your search circle.
    var latitude : Double? {
        didSet {
            base.append("&latitude=\(latitude ?? 46.6734)")
        }
    }
    
    ///Longitude location to be at the center of your search circle.
    var longitude : Double? {
        didSet {
            base.append("&longitude=\(longitude ?? -71.7412)")
        }
    }
    
    func buildUlRL()-> String {
        return base
    }
    
}
