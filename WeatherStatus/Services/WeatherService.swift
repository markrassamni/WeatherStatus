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
    fileprivate var _forecast = [Forecast]()
    
    var currentWeather: CurrentWeather{
        get{
            return _currentWeather
        } set{
            _currentWeather = newValue
        }
    }
    
    var forecast: [Forecast] {
        get{
            return _forecast
        } set{
            _forecast = newValue
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
    
    func downloadForecast(completed: @escaping DownloadComplete){
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData{(response) in
            if let JSON = response.request?.value{
                print(JSON)
                self.forecast = Forecast.loadForecastFromData(response.data!)
                if (self.forecast.count > 0){
                    self.forecast.remove(at: 0)
                }
                completed()
            }
//            Forecast.loadForecastFromData(response.data!)
            
        }
    }
}
