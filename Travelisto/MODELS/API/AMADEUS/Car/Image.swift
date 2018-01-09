//
//  Image.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/29/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//An Image as defined by the API
struct Image : Codable {

    /// The enumerated category of this image type. Common values include EXTERIOR, GUEST_ROOM, SUITE, LOBBY, RESTAURANT, LOUNGE, LOGO, MAP, MISC and UNKNOWN.
    let category : String
    
    /// The pixel width of the image at the provided URL.
    let width : Int
    
    /// The pixel height of the image at the provided URL.
    let height : Int
    
    /// The URL of the struct image of this given category and size, for display.
    let url : URL?
}

