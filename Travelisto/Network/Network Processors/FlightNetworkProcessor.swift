//
//  FlightNetworkProcessor.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation
//Handles call to the API Pertaining to Flight Search
//The methods defined repectively depends on the type of JSON
//to obtain from the API with respect to flights
//
//For the defined method when success, status 200, is reached the type of
//json to decode will depend on the class or struct that
//models structure, ie the key and values in the JSON, defined in the API
class FlightNetworkProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?, CustomError?) -> Void  )
    
    //MARK: METHODS

    //METHOD FOUR =================================================================
    //Downloads LOW FARE SEARCH json from provided url
    //Holds a result of relevant Airport, each item is a type Airport
    //Airpor will be decoded in AirportResult.self (contains a list of Airport)
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
                                let decoder = JSONDecoder()
                                decoder.dateDecodingStrategy = .iso8601
                                    switch withStructType {
                                        case FlightAPISearchBy.location.rawValue:
                                            downloadedObject = try JSONDecoder().decode(Destinations.self, from: successResponseData)
                                        case FlightAPISearchBy.lowPriceFlight.rawValue:
                                            downloadedObject = try JSONDecoder().decode(LowPriceFlight.self, from: successResponseData)
                                        case FlightAPISearchBy.airportAutoComplete.rawValue:
                                            downloadedObject = try JSONDecoder().decode(AirportAutoComplete.self, from: successResponseData)
                                        case FlightAPISearchBy.nearestRelevantAirport.rawValue:
                                            downloadedObject = try JSONDecoder().decode(NearestRelevantAirport.self, from: successResponseData)
                                        case FlightAPISearchBy.location.rawValue:
                                            downloadedObject = try JSONDecoder().decode(NearestRelevantAirport.self, from: successResponseData)
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

    
}//End Class FlightNetworkProcessor
