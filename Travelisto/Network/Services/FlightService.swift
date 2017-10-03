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
    
     typealias JSONObject = ( (Codable?) -> Void  )
    
    func getFlightInspirationSearch (urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = FlightAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = FlightNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.lowPriceFlight.rawValue) { (data) in
            //
        }
        
    }
    
}



