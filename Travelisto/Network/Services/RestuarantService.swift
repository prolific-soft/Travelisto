//
//  RestuarantService.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/19/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Calls the ZOMATO API of different services

class RestuarantService {
    
    typealias JSONObject = ( (Codable?, Codable?) -> Void  )
    
    func getNearbyRestuarantSearch(urlString : String, userKey: String, _ completion : @escaping JSONObject ){
        let endPoint = RestuarantAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = RestuarantProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.nearByRestuarants.rawValue, userKey: userKey) { (data, error) in
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
    }// End getNearbyRestuarantSearch
    
    
    func getRestuarantReview(urlString : String, userKey: String, _ completion : @escaping JSONObject ){
        let endPoint = RestuarantAPISearchBy.self
        let url = URL(string: urlString)!
        let scanProcessor = RestuarantProcessor(url: url)
        scanProcessor.downloadJSONFromURL(withStructType: endPoint.restuarantReview.rawValue, userKey: userKey) { (data, error) in
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
    }// End getRestuarantReview

    
    
}// End class RestuarantService
