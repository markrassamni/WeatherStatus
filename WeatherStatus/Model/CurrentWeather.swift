//
//  CurrentWeather.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
    
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    fileprivate var _lowTemp: Int!
    fileprivate var _highTemp: Int!
    
    var cityName: String {
        get{
            return _cityName
        } set {
            _cityName = newValue
        }
    }
    
    var date: String {
        get{
            return _date
        } set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get{
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Int {
        get{
            return _currentTemp
        } set{
            _currentTemp = newValue
        }
    }
    
    var lowTemp: Int {
        get{
            return _lowTemp
        } set{
            _lowTemp = newValue
        }
    }
    
    var highTemp: Int{
        get{
            return _highTemp
        } set{
            _highTemp = newValue
        }
    }
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather{
        let currentWeather = CurrentWeather()
        let swiftyJSON = JSON(data: APIData)
        
        currentWeather.cityName = swiftyJSON["name"].stringValue.capitalized
        currentWeather.weatherType = swiftyJSON["weather"][0]["main"].stringValue.capitalized
        currentWeather.currentTemp = swiftyJSON["main"]["temp"].intValue
        currentWeather.lowTemp = swiftyJSON["main"]["temp_min"].intValue
        currentWeather.highTemp = swiftyJSON["main"]["temp_max"].intValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        currentWeather.date = "Today, \(currentDate)"
        
        
        return currentWeather
    }
    
    
    
    
    
}
