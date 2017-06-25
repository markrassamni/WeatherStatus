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
    @IBOutlet weak var poweredByBtn: NSButton!
    @IBOutlet weak var quitBtn: NSButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.0)
        updateUI()
        quitBtn.styleButtonText(button: quitBtn, buttonName: "Quit", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        poweredByBtn.styleButtonText(button: poweredByBtn, buttonName: "Powered by OpenWeatherMap", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        
    }
    
    @IBAction func poweredByBtnPressed(_ sender: Any) {
        let url = URL(string: API_HOME_PAGE)
        NSWorkspace.shared.open(url!)
    }
    
    @IBAction func quitBtnPressed(_ sender: Any) {
        NSApplication.shared.terminate(nil)
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
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forecastItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "WeatherCell"), for: indexPath)
        
        guard let forecastCell = forecastItem as? WeatherCell else { return forecastItem }
        
        forecastCell.configureCell(weatherCell: WeatherService.instance.forecast[indexPath.item])
        
        return forecastCell
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherService.instance.forecast.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}

