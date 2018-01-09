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
    
    func getPointsOfInterestSearch(urlString : String, _ completion : @escaping JSONObject ){
        let endPoint = POIAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = PointsOfInterestNetworkProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.PointsOfInterestResult.rawValue) { (data, error) in
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
    }// End getPointsOfInterestSearch

    
}// End class PointsOfInterestService
