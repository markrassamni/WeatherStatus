//
//  Constants.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()

let NOTIF_DOWNLOAD_COMPLETE = NSNotification.Name("dataDownloaded")
let API_KEY = "&appid=73d25876370dcdca2a9580bf2014a81d"
let API_UNITS = "&units=imperial"
let LONG = Location.instance.longitude
let LAT = Location.instance.latitude
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=\(LAT)&lon=\(LONG)\(API_KEY)\(API_UNITS)"
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(LAT)&lon=\(LONG)&cnt=8\(API_UNITS)\(API_KEY)"
let API_HOME_PAGE = "https://openweathermap.org"
