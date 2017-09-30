//
//  HotelAirports.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/28/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


// The "Hotel Airport search", the "Hotel Geosearch by circle"
// and the "Hotel Geosearch by box returns the same result
// of the same structure. This struct can be used in both cases

//The hotels around a given airport

struct HotelAirports : Codable {
    
    /// The array of search result objects, sorted by price. The length of the array will correspond to the number_of_results parameter used in the input.
    let results : [Hotel]
}




