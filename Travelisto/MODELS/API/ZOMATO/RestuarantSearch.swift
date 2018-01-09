//
//  RestuarantSearch.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Shows a list of restuarants for a search in a given location

struct RestuarantSearch : Codable {
    
    let resultsFound : Int
    let resultsStart : Int
    let resultsShown : Int
    let restaurants : [Restuarant]?
    
    private enum CodingKeys : String, CodingKey {
        case resultsFound = "results_found"
        case resultsStart = "results_start"
        case resultsShown = "results_shown"
        case restaurants
    }
}
