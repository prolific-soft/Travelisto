//
//  Hotel.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//Hotel as defined by the API

//TODO: Make all the member variable values optional
// because if the value is not in the API it will
// throw optional error. Making the fields optional
// will protect this error

struct Hotel : Codable {
    
    ///The 8 character property code of this given hotel. The first 2 characters of this code are the chain code that can be specified in the input. The remaining elements are proprietary to each hotel chain.
    let propertyCode : String
    
    /// The name of this hotel.
    let propertyName : String
    
    /// The name of this hotel.
    let marketingText : String?
    
    
    struct Location : Codable {
        let latitude : Double
        let longitude : Double
    }
    
    /// This hotel's approximate geolocation as a location object.
    let location : Location?
    
    /// This hotel's postal address as an address object.
    let address : Address
    
    /// The lowest price of a stay, from the given check in date to the given check out date.
    let totalPrices : Amount
    
    /// The lowest price per day that the hotel offers between the given check-in and check-out dates. Extra taxes may apply to this rate.
    let minDailyRate : Amount
    
    struct Contact : Codable {
        let type : String
        let detail : String
    }
    
    /// An array of contact objects to tell the user how to contact the hotel. Typically includes a phone and fax number.
    let contacts : [Contact]
    
    
    struct Amenity : Codable {
        
        // TODO : Create AmenityCode.csv file
        /// The amenity code See AmenityCode.csv
        let amenity : String
        
        /// The Open Travel Alliance Hotel Amenities Code for this amenity.
        let otaCode : Int
        
        /// The decoded text description for this amenity code, where available.
        let description : String
        
        private enum CodingKeys : String, CodingKey {
            case amenity
            case otaCode = "ota_code"
            case description
        }
    }
    
    /// An array of amenity objects to the user what facilities this hotel might provide, such as a pool or parking. If this array is empty, it does not necessarily mean that there are no amenities available at this hotel, it could also mean that the hotel does not list their amenities in our search!
    let amenities : [Amenity]
    
    struct Award  : Codable {
        /// The organization that issued the award. For example:. Local Star Rating, AAA.
        let provider : String
        
        /// The level of the award that was awarded on the provider's scale. For example: 4 or RECOMMENDED.
        let rating : String
        
    }
    
    
    /// An array of hotel award objects to give the user an expectation of the service quality at this hotel. This can be used to indicate, for example, the star rating of a hotel. If this array is empty, it does not necessarily mean that the hotel has no awards, it could simply mean that they didn't tell us about them!
    let awards : [Award]?   //Check for the value on API
    
    /// A selection of image objects, showing pictures of the hotel building, the entrance or some rooms, to give an indication of what to expect at this hotel. Note that redistribution of images outside Amadeus products requires licensing from our image providers: Leonardo and Ice Portal. Thus image links are returned for whitelisted Amadeus users only.
    let images : [URL]?    //Check for this value too
    
    
    struct Room : Codable {
        
        /// The booking code identifies a product at the hotel. It can be used to book a room.
        let bookingCode : String
        
        /// A 3-letter code to identify a specific room type. The letters may be representative, for example A1Q: A=Superior, 1=1 bed, Q=Queen size.
        let roomTypeCode : String
        
        /// A 3 letter code to designate different rates base on traveler type.
        let ratePlanCode : String
        
        /// Amount for stay and currency
        let totalAmount : Amount
        
        struct Rate : Codable {
            let startDate : String
            let endDate : String
            let currencyCode : String
            let price : Double
            
            private enum CodingKeys : String, CodingKey {
                case startDate = "start_date"
                case endDate  = "end_date"
                case currencyCode = "currency_code"
                case price
            }
        }
        
        /// An array of room rate objects including start_date, end_date, currency_code and price for the given stay period. If room rates are different during the stay period, multiple rate objects are displayed with various rates corresponding to their dates.
        let rates : [Rate]
        
        /// An array of description objects describing room and rate types features.
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
        case minDailyRate = "min_daily_rate"
        case contacts
        case amenities
        case awards
        case images
        case rooms
        case links = "_links"
    }
    
    
}//End Hotel

