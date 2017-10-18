//
//  AppDelegate.swift
//  Travelisto
//
//  Created by Chidi Emeh on 9/25/17.
//  Copyright © 2017 Chidi Emeh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
         var hurl = HotelURL(withGeosearchCircle: "search-circle")
        
        //hurl.location = "BOS"
        hurl.longitude = -115.1541
        hurl.latitude = 36.0857
        hurl.radius = 42
        hurl.checkIn = "2017-12-15"
        hurl.checkOut = "2017-12-16"
        
        let hon = hurl.buildUlRL()
        
        print(hon)
        
        let hotelService = HotelService()
        
        
        hotelService.getHotelGeosearchByCircle(urlString: hon) { (obj, err) in
            if err != nil {
                print((err as! CustomError).message)
            }else {
                print(obj.debugDescription)
            }
        }
        
       
    
        
        
//
//
//       var tsurl = CarURL(withRentalAirport: "search-airport")
//        //var tsurl = CarURL(withRentalGeosearch: "search-circle")
//           // tsurl.latitude = 35.1504
//           // tsurl.longitude = -114.57632
//           // tsurl.radius = 42
//
//
//            tsurl.location = "NCE"
//            tsurl.pickUp = "2017-12-07"
//            tsurl.dropOff = "2017-12-08"
//
////        tsurl.infants = 1
////        tsurl.nonstop = false
////
////        //tsurl.currency = "USD"
////        //tsurl.travelClass = "ECONOMY"
////        tsurl.numberOfResults = 2
////
//        let con = tsurl.buildUlRL()
////
//        print(con)
//
//
////        let pickupservice = CarService()
////        pickupservice.getCarRentalGeosearch(urlString: con) { (obj, err) in
////                        if err != nil {
////                            print((err as! CustomError).message)
////                        }else {
////                            print(obj.debugDescription)
////                        }
////        }
//
//        let carService = CarService()
//        carService.getCarRentalAirportSearch(urlString: con) { (data, error) in
//
//            if error != nil {
//                 print((error as! CustomError).message)
//            }else {
//                print(data.debugDescription)
//            }
//        }
//
//
////        let service = FlightService()
////        service.getFlightInspirationSearch(urlString: con) { (obj, err) in
////            if err != nil {
////                print((err as! CustomError).message)
////            }else {
////                print(obj.debugDescription)
////            }
////        }
//
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

