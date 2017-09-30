//
//  TopFlightDestination.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

struct TopFlightDestination : Codable {
    
    
    struct SearchPeriod : Codable {
        let market : String
        let ptype : String
        let period : Date
        
        struct Ond : Codable {
            let origin : String
            let destination : String
        }
        
        let onds : [Ond]
        let nbReq : Int
        
        let topOnds : [[String]] //Check API
        let topDestinations : [[String]] // Check API 
        let advancePurchase : [Int]
        
        let depWeek : [[String]] //Check API
    }
    
    let searchBySearchPeriod : [SearchPeriod]
    
    private enum CodingKeys : String, CodingKey {
        case searchBySearchPeriod = "search_by_search_period"
    }
}
