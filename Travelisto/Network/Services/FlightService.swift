//
//  FlightService.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


//Uses FlightNetWork Processor to get approriate JSON data

class FlightService {
    
    
    let apiKey : String
    let origin : String
    
    init(apiKey: String, origin: String) {
        self.apiKey = apiKey
        self.origin = origin
    }
    
    func getFlightInspirationSearch (destination: String, depatureDate : String , oneWay : Bool = false ){
        
        
    }
    
}



