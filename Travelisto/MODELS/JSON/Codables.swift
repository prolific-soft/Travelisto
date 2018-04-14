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
//struct CuniqueSymbol : Codable {
//    let grapheme : String
//    let template : String
//    let rtl : Bool
//}
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
//Airports
