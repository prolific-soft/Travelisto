//
//  PointsOfInterestResult.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

// Provide Documentation
// TODO: Commennts

struct PointsOfInterestResult : Codable {
    
    struct City : Codable {
        let name : String
        let location : Coordinates
        let geonameID : Int
        let totalPointsOfInterest : Int
        let importantNote : String
        
        private enum CodingKeys : String, CodingKey {
            case name
            case location
            case geonameID = "geoname_id"
            case totalPointsOfInterest = "total_points_of_interest"
            case importantNote = "important_note"
        }
    }
    
    let currentCity : City
    
    struct PointOfInterest : Codable {
        let title : String
        let categories : [String]
        
        struct Grade : Codable {
            let cityGrade : Int
            let yapqGrade : Double?
            
            private enum CodingKeys : String, CodingKey {
                case cityGrade = "city_grade"
                case yapqGrade = "yapq_grade"
            }
        }
        
        let grades : Grade
        let geonameID : Int
        let mainImage : URL?
        
        
        struct Detail : Codable {
            let description : String
            let wikiPageLink : URL?
            let shortDescription : String
            
            private enum CodingKeys : String, CodingKey {
                case description
                case wikiPageLink = "wiki_page_link"
                case shortDescription = "short_description"
            }
        }
        
        let details : Detail
        
        struct InterestLocation : Codable {
            let longitude : Double
            let latitude : Double
            let googleMapsLink : URL?
            
            private enum CodingKeys : String, CodingKey {
                case longitude
                case latitude
                case googleMapsLink = "google_maps_link"
            }
        }
        
        let location : InterestLocation
        //let walkTime : Double?
        
        private enum CodingKeys : String, CodingKey {
            case title
            case categories
            case grades
            case geonameID = "geoname_id"
            case mainImage = "main_image"
            case details
            case location
            //case walkTime = "walk_time"
        }
    }
    
    let pointsOfInterest : [PointOfInterest]
    
    private enum CodingKeys : String, CodingKey {
        case currentCity = "current_city"
        case pointsOfInterest = "points_of_interest"
    }
    
    
    
} // End Class PointsOfInterestResult
