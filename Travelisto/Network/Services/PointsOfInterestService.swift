//
//  PointsOfInterestService.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


//Uses PointsOfInterestNetWork Processor to get approriate JSON data

class PointsOfInterestService {
    
    typealias JSONObject = ( (Codable?, Codable?) -> Void  )
    typealias AutoObject = ( (Codable?) -> Void  )
    
    func getHotelAirportSearch(urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = HotelAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = HotelNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.hotelAirportSearch.rawValue) { (data, error) in
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
    }// End getHotelAirportSearch
    
    
    
}// End class PointsOfInterestService
