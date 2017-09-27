//
//  NetworkProcessor.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/27/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation



//Makes a call to download JSON for a given API
class NetworkProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?) -> Void  )
    
    //Downloads json for a url
    func downloadJSONFromURL(withStructType: String, _ completion : @escaping JSONObject ){
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        print("Success")
                        if let responseData = data {
                            do{
                                var downloadedObject : Codable?
//                                switch withStructType {
//                                case "article":
//                                    downloadedObject = try JSONDecoder().decode(Article.self, from: responseData)
//                                case "articles":
//                                    downloadedObject = try JSONDecoder().decode(Articles.self, from: responseData)
//                                    print("Articles was downloaded")
//                                case "source":
//                                    downloadedObject = try JSONDecoder().decode(Source.self, from: responseData)
//                                case "sources":
//                                    downloadedObject = try JSONDecoder().decode(Sources.self, from: responseData)
//                                default:
//                                    print("No conformable case was found!")
//                                }
                                completion(downloadedObject)
                            }catch let error as NSError {
                                print("Error decoding: \(error)")
                            }
                        }
                    default:
                        //eg Status 400 : Bad Request
                        //Sends the message to the user so they can correct search term
                        //or parameter requirements
                        //The Response from the status code is converted to Error
                        //object so that the message can be retrieved and sent to
                        //the user
                        print("Response Status code: \(httpResponse.statusCode)")
                        
                    }
                }
            }else {
                print(error?.localizedDescription ?? "Error downloading task")
            }
        }
        dataTask.resume()
        
    }
    
    
    
    
}
