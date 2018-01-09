//
//  PointOfInterestURL.swift
//  Travelisto
//
//  Created by Chidi Emeh on 10/12/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import Foundation

/// Builds the URL for POI Search API
/// The fields are as defined in the API
struct PointsOfInterestURL {
    
    var base : String
    var apiKey : String
    
    //TODO: Refactor base url to so that it will be constructed using a class or
    // enum to avoid typed string
    
    init(){
        self.base = "https://api.sandbox.amadeus.com/v1.2/points-of-interest/yapq-search-circle?"
        self.apiKey = ""
        base.append("apikey=\(apiKey)")
    }
    
    /// The name of the supported city for which you are searching, in the selected language.
    var cityName : String? {
        didSet {
            base.append("&city_name=\(cityName ?? "BOSTON")")
        }
    }
    
    /// The preferred language of the content related to each hotel.
    /// Content will be returned in this language if available. Eg. EN
    var lang : String? {
        didSet {
            base.append("&lang=\(lang ?? "EN")")
        }
    }
    
    
    /// Latitude of the center of the search, in decimal degrees
    var latitude : Double? {
        didSet {
            base.append("&latitude=\(latitude ?? 49.10)")
        }
    }
    
    /// Longitude of the center of the search, in decimal degrees
    var longitude : Double? {
        didSet {
            base.append("&longitude=\(longitude ?? -123.11934)")
        }
    }
    
    /// Radius around the center to look for points-of-interest around
    /// the given latitude and longitude in kilometers (km)
    var radius : Int? {
        didSet {
            base.append("&radius=\(radius ?? 42)")
        }
    }
    
    /// Filters the resulting points_of_interest to include only results
    /// which have a least one category containing the given provided word.
    /// Good examples are museum, landmark or church
    var category : String? {
        didSet {
            base.append("&category=\(category ?? "Museum")")
        }
    }
    
    /// Setting this to true includes only points of interest with a geonames ID
    var geonames : Bool? {
        didSet {
            base.append("&geonames=\(geonames ?? false)")
        }
    }
    
    /// Includes content that doesn't correspond to an active physical place,
    /// but which gives the user some background information, or vibe for the place they are visiting.
    var vibes : Bool? {
        didSet {
            base.append("&vibes=\(vibes ?? false)")
        }
    }
    
    /// Enabling this includes images from Instagram in the output results. This is disabled by default,
    /// since these images are often just pictures of people or food, which often
    /// have little relevance to the actual location
    var socialMedia : Bool? {
        didSet {
            base.append("&social_media=\(socialMedia ?? false)")
        }
    }
    
    /// The size of the images you'd like to see in the response
    var imageSize : String? {
        didSet {
            base.append("&image_size=\(imageSize ?? "MEDIUM")")
        }
    }
    
    /// Number of images to display
    var numberOfImages : Int? {
        didSet {
            base = base + "&number_of_images=\(numberOfImages ?? 4)"
        }
    }
    
    /// The maximum number of points of interest to return in the
    /// results set. This is a range from 1 to 100
    var numberOfResults : Int? {
        didSet {
            base = base + "&number_of_results=\(numberOfResults ?? 20)"
        }
    }
    
    func buildUlRL()-> String {
        return base
    }
    
    
}// End PointsOfInterestURL

