//
//  CarURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/12/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


/// Creates the URL to access the API.
/// The fields are defined in the API

struct CarURL {
   
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    /// Must be set with "search-airport"
    init(withRentalAirport: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/cars/\(withRentalAirport)?"
        self.apiKey = ""
        base.append("&apikey=\(apiKey)")
    }
    
    /// Must be set with "search-circle"
    init(withRentalGeosearch: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/cars/\(withRentalGeosearch)?"
        self.apiKey = ""
        base.append("&apikey=\(apiKey)")
    }

    
    /// Latitude of the center of the search. Required for Geosearch circle
    var latitude : Double? {
        didSet {
            base.append("&latitude=\(latitude ?? 36.0857)")
        }
    }
    
    /// Longitude of the center of the search. Required for Geosearch circle
    var longitude : Double? {
        didSet {
            base.append("&longitude=\(longitude ?? -115.1541)")
        }
    }
    
    /// Radius around the center to look for hotels in kilometers (km).
    var radius : Int? {
        didSet {
            base.append("&radius=\(radius ?? 42)")
        }
    }
    
    /// IATA airport code for hotel availability is required requested. Eg. BOS
    var location : String? {
        didSet {
            base.append("&location=\(location ?? "")")
        }
    }
    
    /// Pick up date
    var pickUp : String? {
        didSet {
            base.append("&pick_up=\(pickUp ?? "2017-12-07")")
        }
    }
    
    /// Pick up date
    var dropOff : String? {
        didSet {
            base.append("&drop_off=\(dropOff ?? "2017-12-08")")
        }
    }
    
    /// The preferred language of the content related to each hotel.
    /// Content will be returned in this language if available. Eg. EN
    var lang : String? {
        didSet {
            base.append("&lang=\(lang ?? "EN")")
        }
    }
    
    /// The preferred currency for the results
    var currency : String? {
        didSet {
            base = base + "&currency=\(currency ?? "USD")"
        }
    }
    
    /// 2 character car rental provider code.
    /// parameter can be provided more than once.
    var provider : String? {
        didSet {
            base = base + "&provider=\(provider ?? "ZI")"
        }
    }
    
    /// Allows to request specific rate types.
    var rateClass : String? {
        didSet {
            base = base + "&rate_class=\(rateClass ?? "ALL")"
        }
    }
    
    /// Qualifies the rate depending on the pickup date
    /// and the rental duration.
    var ratePlan : String? {
        didSet {
            base = base + "&rate_plan=\(ratePlan ?? "DAILY")"
        }
    }
    
    /// Defines the types of rates to be returned in the output
    var rateFilter : String? {
        didSet {
            base = base + "&rate_filter=\(rateFilter ?? "ESTIMATED")"
        }
    }
    
    /// Specifies the type of vehicle to be rented. If selected, the
    /// results set will include only vehicles that match these type descriptions.
    var vehicle : String? {
        didSet {
            base = base + "&vehicle=\(vehicle ?? " ")"
        }
    }
    
    
    func buildUlRL()-> String {
        return base
    }
    
    
}// End Struct CarURL
