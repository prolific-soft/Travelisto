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













