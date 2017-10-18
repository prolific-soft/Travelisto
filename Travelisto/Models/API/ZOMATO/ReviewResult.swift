//
//  ReviewResult.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/18/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

//The struct containing a list of reviews

struct ReviewResult : Codable {
    
    let reviewsCount : Int
    let reviewsStart : Int
    let reviewsShown : Int
    let userReviews : [Review]
    let respondToReviewsViaZomatoDashboard : URL?
    
    private enum CodingKeys : String, CodingKey {
        case reviewsCount = "reviews_count"
        case reviewsStart = "reviews_start"
        case reviewsShown = "reviews_shown"
        case userReviews = "user_reviews"
        case respondToReviewsViaZomatoDashboard = "Respond to reviews via Zomato Dashboard"
    }
    
}// End struct ReviewResult

