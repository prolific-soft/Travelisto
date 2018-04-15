//
//  Language.swift
//  Travelisto
//
//  Created by Chidi Emeh on 4/13/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation



//Languages
struct Clanguage : Codable {
    
    let code : String
    let name : String
    let nativeName : String

}

//Currency
struct Csymbol : Codable {
    let grapheme : String
    let template : String
    let rtl : Bool
}
struct Ccurrency : Codable {
    let name : String
    let fractionSize : Int
    let symbol : Csymbol?
    let uniqSymbol : Csymbol?
}

struct CcurrencyStruct : Codable {
    let data : [String : Ccurrency]
    
    init(data : [String : Ccurrency] ) {
        self.data = data
    }
}

//Units
struct Cunit : Codable {
    let name : String
    let historical : Bool?
    let inherits : String?
}

struct CunitStruct : Codable {
    let data : [String : Cunit]
    
    init(data : [String : Cunit] ) {
        self.data = data
    }
}

//Airport
struct Cairport : Codable {
    let code : String
    let lat : String
    let lon : String
    let name : String
    let city : String
    let state : String
    let country : String
    let woeid : String
    let tz : String
    let phone : String
    let type : String
    let email : String
    let url: String
    let runwayLength : String
    let elev : String
    let icao : String
    let directFlights : String
    let carriers : String
    
    private enum CodingKeys : String, CodingKey {
        case code
        case lat
        case lon
        case name
        case city
        case state
        case country
        case woeid
        case tz
        case phone
        case type
        case email
        case url
        case runwayLength = "runway_length"
        case elev
        case icao
        case directFlights = "direct_flights"
        case carriers
    }
    
}

























