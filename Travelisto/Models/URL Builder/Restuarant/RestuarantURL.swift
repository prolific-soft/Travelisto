//
//  RestuarantURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/*
 
 The location input can be specified using Zomato location ID or coordinates.
 Cuisine / Establishment / Collection IDs can be obtained from respective api calls.
 Get up to 100 restaurants by changing the 'start' and 'count' parameters with the
 maximum value of count being 20. Partner Access is required to access photos and reviews.
 
 Examples:
 To search for 'Italian' restaurants in 'Manhattan, New York City',
      set cuisines = 55, entity_id = 94741 and entity_type = zone
 To search for 'cafes' in 'Manhattan, New York City', set establishment_type = 1,
     entity_type = zone and entity_id = 94741
 Get list of all restaurants in 'Trending this Week' collection in 'New York City'
     by using entity_id = 280, entity_type = city and collection_id = 1
 
 */

struct RestuarantURL {
    
    var base : String
    //var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://developers.zomato.com/api/v2.1/search?"
       // self.apiKey = ""
      //  base.append("apikey=\(apiKey)")
    }
    
    /// location id
    var userKey : String? {
        didSet {
            base.append("user-key=\(userKey ?? "")")
        }
    }
    
    /// location id
    var entityID : Int? {
        didSet {
            base.append("entity_id=\(entityID ?? 16624739)")
        }
    }
    
    /// search keyword
    var q : String? {
        didSet {
            base.append("&q=\(q ?? "EN")")
        }
    }
    
    /// fetch results after offset
    var start : Int? {
        didSet {
            base.append("&start=\(start ?? 1)")
        }
    }
    
    /// max number of results to display
    var count : Int? {
        didSet {
            base.append("&count=\(count ?? 5)")
        }
    }
    
    /// Latitude
    var lat : Double? {
        didSet {
            base.append("&lat=\(lat ?? 49.10)")
        }
    }
    
    /// Longitude
    var lon : Double? {
        didSet {
            base.append("&lon=\(lon ?? -123.11934)")
        }
    }
    
    /// Radius around (lat,lon); to define search area, defined in meters(M)
    var radius : Int? {
        didSet {
            base.append("&radius=\(radius ?? 42)")
        }
    }
    
    /// list of cuisine id's separated by comma
    var cuisines : String? {
        didSet {
            base.append("&cuisines=\(cuisines ?? "Chinese")")
        }
    }
    
    /// Estblishment id obtained from establishments call
    var establishmentType : String? {
        didSet {
            base.append("&establishment_type=\(establishmentType ?? "Bakery")")
        }
    }
    
    /// Collection id obtained from collections call
    var collectionID : String? {
        didSet {
            base.append("&collection_id=\(collectionID ?? "")")
        }
    }
    
    /// Category ids obtained from categories call
    var category : String? {
        didSet {
            base.append("&category=\(category ?? " ")")
        }
    }
    
    
    func buildUlRL()-> String {
        return base
    }
    
    
}// End RestuarantURL
