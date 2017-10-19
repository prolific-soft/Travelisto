//
//  Restuarant.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//A Restuarant as defined by API

struct Restuarant : Codable {
    
    struct ZomatoRestuarant : Codable {
        
        struct RType : Codable {
            let resID : Int
            private enum CodingKeys : String, CodingKey {
                case resID = "res_id"
            }
        }
        
        let R : RType
        let apiKey : String?
        let id : String
        let name : String
        let url : URL?
        
        struct ZomatoLocation : Codable {
            let address : String
            let locality : String
            let city : String
            let latitude : String
            let longitude : String
            let zipcode : String
            let countryID : Int?
            let localityVerbose : String
            
            private enum CodingKeys : String, CodingKey {
                case address
                case locality
                case city
                case latitude
                case longitude
                case zipcode
                case countryID
                case localityVerbose = "locality_verbose"
            }
        }
        
        let location: ZomatoLocation
        let switchToOrderMenu : Int
        let cuisines : String
        let averageCostForTwo  : Int
        let priceRange : Int
        let currency : String
        let offers : [String]
        let thumb : URL?
        
        struct Rating : Codable {
            let aggregateRating : String
            let ratingText : String
            let ratingColor : String
            let votes : String
            
            private enum CodingKeys : String, CodingKey {
                case aggregateRating = "aggregate_rating"
                case ratingText = "rating_text"
                case ratingColor = "rating_color"
                case votes
            }
        }
        
        let userRating : Rating
        let photosUrl : URL?
        let menuUrl : URL?
        let featuredImage : URL?
        let hasOnlineDelivery : Int
        let isDeliveringNow : Int
        let deeplink : String
        let hasTableBooking : Int
        let eventUrl : URL?
        let establishmentTypes : [String]
        
        
        private enum CodingKeys : String, CodingKey {
            case R
            case apiKey
            case id
            case name
            case url
            case location
            case switchToOrderMenu = "switch_to_order_menu"
            case cuisines
            case averageCostForTwo = "average_cost_for_two"
            case priceRange = "price_range"
            case currency
            case offers
            case thumb
            case userRating = "user_rating"
            case photosUrl = "photos_url"
            case menuUrl = "menu_url"
            case featuredImage = "featured_image"
            case hasOnlineDelivery = "has_online_delivery"
            case isDeliveringNow = "is_delivering_now"
            case deeplink
            case hasTableBooking = "has_table_booking"
            case eventUrl = "event_url"
            case establishmentTypes = "establishment_types"
        }
        
    }// End ZomatoRestuarant
    
    let restaurant : ZomatoRestuarant
    
    
}//End Struct Restuarant
