//
//  NSDate.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/24/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
