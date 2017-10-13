//
//  CarNetworkProcessor.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation


class CarNetworkProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?, CustomError?) -> Void  )
    
    
    //MARK: METHODS
    
    //METHOD ONE =================================================================
    //Download CAR RENTAL AIRPORT json from provided url

    
    //METHOD TWO =================================================================
    //Downloads CAR RENTAL GEOSEARCH
    func downloadJSONFromURL(withStructType: String, _ completion : @escaping JSONObject ){
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        print("Success")
                        if let successResponseData = data {
                            do{
                                var downloadedObject : Codable?
                                    switch withStructType {
                                        case CarAPISearchBy.carRentalAirport.rawValue:
                                            downloadedObject = try JSONDecoder().decode(CarRental.self, from: successResponseData)
                                        case CarAPISearchBy.carRentalGeosearch.rawValue:
                                            downloadedObject = try JSONDecoder().decode(CarRentalGeosearch.self, from: successResponseData)
                                    default:
                                        print("No conformable case was found!")
                                    }
                                completion(downloadedObject, nil)
                            }catch let error as NSError {
                                print("Error decoding: \(error)")
                            }
                        }
                    default:
                        
                        //eg Status 400 :
                        print("Response Status code: \(httpResponse.statusCode)")
                        if let errorData = data {
                            do {
                                let downloadedError = try JSONDecoder().decode(CustomError.self, from: errorData)
                                completion(nil, downloadedError)
                            } catch let error as NSError {
                                print("Error downloading error message: \(error)")
                            }
                        }

                        
                    }
                }
            }else {
                print(error?.localizedDescription ?? "Error downloading task")
            }
        }
        dataTask.resume()
        
    }//End Func downloadJSONFromURL(...)
    
    
}//End Class CarNetworkProcessor
