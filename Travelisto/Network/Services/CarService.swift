//
//  CarService.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Uses carNetWork Processor to get approriate JSON data
class CarService {
    
    typealias JSONObject = ( (Codable?, Codable?) -> Void  )
    typealias AutoObject = ( (Codable?) -> Void  )
    
    func getCarRentalAirportSearch(urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = CarAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = CarNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.carRentalAirport.rawValue) { (data, error) in
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
    }// End getCarRentalAirportSearch
    
    func getCarRentalGeosearch(urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = CarAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = CarNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.carRentalGeosearch.rawValue) { (data, error) in
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
    }// End getCarRentalGeosearch
    
    
}// End Class CarService
