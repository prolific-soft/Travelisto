//
//  FlightAPISearchBy.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

enum FlightAPISearchBy: String {
    case location = "location"
    case lowPriceFlight = "lowPriceFlight"
    case airportAutoComplete = "airportAutoComplete"
    case nearestRelevantAirport = "nearestRelevantAirport"
}
