//
//  CurrentWeather.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation

class CurrentWeather {
    
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
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
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather{
        let currentWeather = CurrentWeather()
        
        do {
            let myJSON = try JSONSerialization.jsonObject(with: APIData, options: .mutableContainers)
            if let dict = myJSON as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String {
                    currentWeather.cityName = name
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                        currentWeather.weatherType = main
                    }
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let currentTemp = main["temp"] as? Int{
                        currentWeather.currentTemp = currentTemp
                    }
                }
                currentWeather.date = "Today"
            }
        } catch let error as NSError{
            print(error)
        }
        
        return currentWeather
    }
    
    
    
    
    
}
