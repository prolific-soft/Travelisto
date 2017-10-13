//
//  HotelAirportURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/12/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Builds the url for Hotel Airport seach
/// fields are created using the inputs from
/// the UI, provided by the user

struct HotelURL {
   
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    /// Must be set with "search-airport"
    init(withAirportSearch: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/hotels/\(withAirportSearch)?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    /// Must be set with "search-circle"
    init(withGeosearchCircle: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/hotels/\(withGeosearchCircle)?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    /// Must be set with "search-box"
    init(withGeosearchBox: String){
        self.base = "https://api.sandbox.amadeus.com/v1.2/hotels/\(withGeosearchBox)?"
        self.apiKey = "Yg5pezGj2nLv0n2KlUNuD0rVRAC03GzC"
        base.append("&apikey=\(apiKey)")
    }
    
    
    /// Latitude of the center of the search. Required for Geosearch circle
    var latitude : Double? {
        didSet {
            base.append("&latitude=\(latitude ?? 36.0857)")
        }
    }
    
    /// Longitude of the center of the search. Required for Geosearch circle
    var longitude : Double? {
        didSet {
            base.append("&longitude=\(longitude ?? -115.1541)")
        }
    }
    
    /// The coordinates of the south-west corner of the search box.
    var southWestCorner : [Double]? {
        didSet {
            base.append("&south_west_corner=\(southWestCorner[0] ?? 38.8675),\(southWestCorner[1] ?? -77.1457)")
        }
    }
    
    /// The coordinates of the north-east corner of the search box.
    var northEastCorner : [Double]? {
        didSet {
            base.append("&north_east_corner=\(northEastCorner[0] ?? 38.9072),\(northEastCorner[1] ?? -77.0632)")
        }
    }
    
    
    /// IATA airport code for hotel availability is required requested. Eg. BOS
    var location : String? {
        didSet {
            base.append("&location=\(location ?? "")")
        }
    }
    /// Date on which the guest will begin their stay in the hotel.
    /// Past availability is not displayed, future availability becomes
    /// less useful from about 6 months from the current date.
    var checkIn : String? {
        didSet {
            base.append("&check_in=\(checkIn ?? "")")
        }
    }
    
    /// Date on which the guest will end their stay in the hotel.
    var checkOut : String? {
        didSet {
            base.append("&check_out=\(checkOut ?? "")")
        }
    }
    
    /// Radius around the center to look for hotels in kilometers (km).
    var radius : Int? {
        didSet {
            base.append("&radius=\(radius ?? 42)")
        }
    }
    
    /// The preferred language of the content related to each hotel.
    /// Content will be returned in this language if available. Eg. EN
    var lang : String? {
        didSet {
            base.append("&lang=\(lang ?? "EN")")
        }
    }
    
    /// The preferred currency for the results
    var currency : String? {
        didSet {
            base = base + "&currency=\(currency ?? "USD")"
        }
    }
    
    /// Narrows the hotel search to a given hotel provider. The hotel
    /// chain is indicated by the first two characters of the property code. Eg. 6C
    var chain : String? {
        didSet {
            base = base + "&chain=\(chain ?? "6C")"
        }
    }
    
    /// The maximum amount per night that any hotel in the shopping response should cost.
    /// This is calculated by dividing the total price of the stay for the given dates by
    /// the number of nights specified falling between the check_in and check_out dates.
    var maxRate : Int? {
        didSet {
             base = base + "&max_rate=\(maxRate ?? 500)"
        }
    }
    
    /// The maximum number of hotels to return in the results set. Hotels are ordered by total
    /// price, so if more than the given maximum number of hotels are available,
    /// only the cheapest options are returned.
    var numberOfResults : Int? {
        didSet {
            base = base + "&number_of_results=\(numberOfResults ?? 10)"
        }
    }

    /// This option if enabled will return all hotel room rates, not just the lowest room rate.
    /// Note: This will have an impact on the response time due to the larger messages returned.
    var allRooms : Bool? {
        didSet {
            base = base + "&all_rooms=\(allRooms ?? false)"
        }
    }

    /// This option if enabled will return hotel names and addresses even if rooms
    /// are sold out (closed properties)
    var showSoldOut : Bool? {
        didSet {
            base = base + "&show_sold_out=\(showSoldOut ?? false)"
        }
    }

    /// Hotel amenities filter to search narrow down hotels with certain amenities. For example:
    /// amenity=POOL. (Note: multiple amenities can be used in
    /// searches: amenity=PARKING&amenity=RESTAURANT&amenity=PETS_ALLOWED).
    /// TODO : Create list of amenities filter Enum
    var amenity : Bool? {
        didSet {
            base = base + "&amenity=\(amenity ?? false)"
        }
    }
    
    func buildUlRL()-> String {
        return base
    }
    
    
}//End Class HotelAirportURL
