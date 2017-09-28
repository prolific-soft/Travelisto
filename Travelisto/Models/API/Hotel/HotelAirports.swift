//
//  HotelAirports.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/28/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The hotels around a given airport

struct HotelAirports : Codable {
    
    struct Hotel : Codable {
        let propertyCode : String
        let propertyName : String
        let marketingText : String
        let location : Coordinates
        let address : Address
        
        struct Amount : Codable {
            let amount : Double
            let currency : String
        }
        
        let totalPrices : Amount
        let minDailyRate : Amount
        
        struct Contact : Codable {
            let type : String
            let detail : String
        }
        
        let contacts : [Contact]
        
        struct Amenity : Codable {
            let amenity : String
            let otaCode : String
            let description : String
            
            private enum CodingKeys : String, CodingKey {
                case amenity
                case otaCode = "ota_code"
                case description
            }
        }
        
        let amenities : [Amenity]
        let awards : [String]?   //Check for this two
        let images : [URL]?    //Check for this value
        
        
        struct Room : Codable {
            let bookingCode : String
            let roomTypeCode : String
            let ratePlanCode : String
            let totalAmount : Amount
            
            struct Rate : Codable {
                let startDate : Date
                let endDate : Date
                let currencyCode : String
                let price : Double
                
                private enum CodingKeys : String, CodingKey {
                    case startDate = "start_date"
                    case endDate  = "end_date"
                    case currencyCode = "currency_code"
                    case price
                }
            }
            
            let rates : [Rate]
            let descriptions : [String]
            
            struct RoomType : Codable {
                let roomType : String
                
                private enum CodingKeys : String, CodingKey {
                    case roomType = "room_type"
                }
            }
            
            let roomTypeInfo : RoomType
            let rateTypeCode : String
            
            private enum CodingKeys : String, CodingKey {
                case bookingCode = "booking_code"
                case roomTypeCode = "room_type_code"
                case ratePlanCode = "rate_plan_code"
                case totalAmount = "total_amount"
                case rates
                case descriptions
                case roomTypeInfo  = "room_type_info"
                case rateTypeCode = "rate_type_code"
            }
        }
        
        let rooms : [Room]
        
        struct Link : Codable {
            
            struct Href : Codable {
                let href : URL
            }
            
            let moreRoomsAtThisHotel : Href
            private enum CodingKeys : String, CodingKey {
               case moreRoomsAtThisHotel = "more_rooms_at_this_hotel"
            }
        }
        
        let links : Link
        
        private enum CodingKeys: String, CodingKey {
            
            case propertyCode = "property_code"
            case propertyName = "property_name"
            case marketingText = "marketing_text"
            case location
            case address
            case totalPrices = "total_price"
            case minDailyRate
            case contacts
            case amenities
            case awards
            case images
            case rooms
            case links
        }
        
        
    }//End Hotel
    
    
    
    let results : [Hotel]
}



