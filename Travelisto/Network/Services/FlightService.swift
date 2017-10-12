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
    
    typealias JSONObject = ( (Codable?, Codable?) -> Void  )
    typealias AutoObject = ( (Codable?) -> Void  )
    
    func getFlightInspirationSearch (urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = FlightAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = FlightNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.lowPriceFlight.rawValue) { (data, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }else {
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            }
        }
    }// End getFlightInspirationSearch
    
    
    
    func getAirportAutocomplete(searchString : String, _completion : @escaping AutoObject ) {

        let endPoint = FlightAPISearchBy.self
        let url = URL(string: searchString)!
        let scanProcessor = FlightNetworkProcessor(url: url)
//        scanProcessor.downloadJSONFromURL(withStructType: endPoint.lowPriceFlight.rawValue) { (data) in
//            if error != nil {
//                DispatchQueue.main.async {
//                    completion(data)
//                }
//            }
//        }
        
        
    } // End getAirportAutocomplete
    
    
    
    
}// End Class FlightService
