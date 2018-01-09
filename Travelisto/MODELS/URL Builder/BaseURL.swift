//
//  baseURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/11/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

///The string values for forming the base url based on the
///the various sections in the API.
///this is created do we dont have strings in the base url instead
///we can have everything here and just in case it changes

struct BaseURL {
    
    enum base : String {
        case base = "https://api.sandbox.amadeus.com/v1.2"
    }
    
    enum flights : String {
        case flights = "/flights"
    }
    
    enum airports : String {
        case airports = "/airports"
    }
    
    enum FlightsSection: String {
        case inspirationSearch = "/inspiration-search"
        case extensiveSearch = "/extensive-search"
        case lowFareSearch = "/low-fare-search"
        case airportAutoComplete = "/autocomplete"
        case nearestRelevantAirport = "/nearest-relevant"
    }
    
    
    enum hotels : String {
        case hotels = "/hotels"
    }
    
    enum HotelSection: String {
        case hotelAirportSearch = "/search-airport"
        case hotelGeosearchByCircle = "/search-circle"
        case hotelGeosearchByBox = "/search-box"
    }
    
    
    enum cars : String {
        case cars = "/cars"
    }
    
    enum CarSection: String {
        case carRentalAirport = "/search-airport"
        case carRentalGeosearch = "/search-circle"
    }

    enum pointsOfInterest : String {
        case poi = "/points-of-interest"
    }
    
    enum POISection: String {
        case yapQCityNameSearch = "yapq-search-text"
    }
    

    
}// End BaseURL
