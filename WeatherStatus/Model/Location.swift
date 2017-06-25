//
//  Location.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/25/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation


class Location {
    
    static var instance = Location()
    
    fileprivate var _latitude: Double!
    fileprivate var _longitude: Double!
    
    var latitude: Double {
        get{
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double {
        get{
            return _longitude
        } set{
            _longitude = newValue
        }
    }

    
}
