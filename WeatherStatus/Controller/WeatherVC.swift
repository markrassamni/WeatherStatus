//
//  WeatherVC.swift
//  WeatherStatus
//
//  Created by Mark Rassamni on 6/23/17.
//  Copyright © 2017 markrassamni. All rights reserved.
//

import Cocoa

class WeatherVC: NSViewController {
    
    @IBOutlet weak var dateLbl: NSTextField!
    @IBOutlet weak var tempLbl: NSTextField!
    @IBOutlet weak var cityLbl: NSTextField!
    @IBOutlet weak var weatherImg: NSImageView!
    @IBOutlet weak var weatherConditionLbl: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
        updateUI()
        
    }

    func updateUI(){
        let weather = WeatherService.instance.currentWeather
        dateLbl.stringValue = weather.date
        tempLbl.stringValue = "\(weather.currentTemp)°"
        cityLbl.stringValue = weather.cityName
        weatherConditionLbl.stringValue = weather.weatherType
        weatherImg.image = NSImage(named: NSImage.Name(rawValue: weather.weatherType))
        
    }


}

extension WeatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: NSCollectionView, willDisplay item: NSCollectionViewItem, forRepresentedObjectAt indexPath: IndexPath) {
//
//    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forcastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath)
        return forcastItem
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}

