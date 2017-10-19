//
//  Review.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// The review given by previous users on a
/// restuarant

struct Review : Codable {
    
    struct UserReview : Codable {
        let rating : Double
        let reviewText : String
        let id : String
        let ratingColor : String
        let reviewTimeFriendly : String
        let ratingText : String
        let timestamp : Int
        let likes : Int
        
        
        struct User : Codable {
            let name : String
            let zomatoHandle : String?
            let foodieLevel : String
            let foodieLevelNum : Int
            let foodieColor : String
            let profileURL : URL?
            let profileImage : URL?
            let profileDeeplink : String
            private enum CodingKeys : String, CodingKey {
                case name
                case zomatoHandle = "zomato_handle"
                case foodieLevel = "foodie_level"
                case foodieLevelNum = "foodie_level_num"
                case foodieColor = "foodie_color"
                case profileURL = "profile_url"
                case profileImage = "profile_image"
                case profileDeeplink = "profile_deeplink"
            }
        }
        
        
        let user : User
        let commentsCount : Int
        
        private enum CodingKeys : String, CodingKey {
            case rating
            case reviewText = "review_text"
            case id
            case ratingColor = "rating_color"
            case reviewTimeFriendly = "review_time_friendly"
            case ratingText = "rating_text"
            case timestamp
            case likes
            case user
            case commentsCount = "comments_count"
        }
    }
    
    
    let review : UserReview
    
    
}// End struct Review
