//
//  WeatherCell.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {

    @IBOutlet weak var weatherCellImg: NSImageView!
    @IBOutlet weak var cellDate: NSTextField!
    @IBOutlet weak var highTemp: NSTextField!
    @IBOutlet weak var lowTemp: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
        self.view.layer?.cornerRadius = 5
    }
    
}
