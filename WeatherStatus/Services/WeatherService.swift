//
//  WeatherService.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    static let instance = WeatherService()
    fileprivate var _currentWeather = CurrentWeather()
    
    var currentWeather: CurrentWeather{
        get{
            return _currentWeather
        } set{
            _currentWeather = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData{ (response) in
            if let JSON = response.result.value{
                print(JSON)
                self.currentWeather = CurrentWeather.loadCurrentWeatherFromData(response.data!)
                print(self.currentWeather.cityName)
                print(self.currentWeather.weatherType)
                print(self.currentWeather.currentTemp)
                print(self.currentWeather.date)
                completed()
            } else {
                print("Could not get JSON")
            }
        }
    }
}
