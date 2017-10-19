//
//  RestuarantReviewURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Get restaurant reviews using the Zomato restaurant ID.
/// Only 5 latest reviews are available under the Basic API plan.

struct RestuarantReviewURL {
    
    var base : String
    //var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://developers.zomato.com/api/v2.1/reviews?"
        // self.apiKey = ""
        //  base.append("apikey=\(apiKey)")
    }
    
    /// location id
    var userKey : String? {
        didSet {
            base.append("user-key=\(userKey ?? "")")
        }
    }
    
    /// id of restaurant whose details are requested
    var resID : Int? {
        didSet {
            base.append("&res_id=\(resID ?? 16624739)")
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
    
    func buildUlRL()-> String {
        return base
    }
    
    
}// End struct RestuarantReviewURL
