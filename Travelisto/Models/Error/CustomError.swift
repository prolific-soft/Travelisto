//
//  CustomError.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/3/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

///Error returned from calling the API.
///Eg. Not using proper fields

struct CustomError : Codable {
    
    let status : Int
    let message : String
//    let messageInfo : String
//    
//    private enum CodingKeys : String, CodingKey {
//        case status
//        case message
//        case messageInfo = "message_info"
//    }
    
}




