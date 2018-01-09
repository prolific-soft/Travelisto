//
//  RestuarantProcessor.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/19/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

class RestuarantProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?, CustomError?) -> Void  )
    
    //MARK: METHOD
    
    func downloadJSONFromURL(withStructType: String, userKey: String,  _ completion : @escaping JSONObject ){
        var request = URLRequest(url: url)
        
        request.httpMethod = "Get"
        request.addValue(userKey, forHTTPHeaderField: "user-key")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
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
                                case RestuarantAPISearchBy.nearByRestuarants.rawValue:
                                    downloadedObject = try JSONDecoder().decode(RestuarantSearch.self, from: successResponseData)
                                case RestuarantAPISearchBy.restuarantReview.rawValue:
                                    downloadedObject = try JSONDecoder().decode(ReviewResult.self, from: successResponseData)
                                default:
                                    print("No conformable case was found!")
                                }
                                completion(downloadedObject, nil)
                            }catch let error as NSError {
                                print("Error decoding: \(error)")
                            }
                        }
                    default:
                        print("Response Status code: \(httpResponse.statusCode)")
  
                    }
                }
            }else {
                print(error?.localizedDescription ?? "Error downloading task")
            }
        }
        dataTask.resume()
        
    }//End Func downloadJSONFromURL(...)
    
    
}//End Class HotelNetworkProcessor
