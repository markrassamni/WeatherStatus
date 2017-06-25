//
//  Constants.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let API_KEY = "&appid=73d25876370dcdca2a9580bf2014a81d"
let API_UNITS = "&units=imperial"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=32.77&lon=-117.08\(API_KEY)\(API_UNITS)"
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=32.77&lon=-117.08&cnt=8\(API_UNITS)\(API_KEY)"
