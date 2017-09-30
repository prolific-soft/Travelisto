//
//  Coordinates.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


/// The lat and lon of a place
struct Coordinates : Codable {
    
    /// The north-south location of this hotel, in decimal degrees, between -90 and 90.
    let latitiude : Double
    
    /// The east-west location of this hotel, in decimal degrees, between -180 and 180.
    let longitude : Double
}
