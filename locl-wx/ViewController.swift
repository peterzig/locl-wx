//
//  ViewController.swift
//  locl-wx
//
//  Created by Jack Davis on 11/15/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import UIKit
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var weatherIconImg: UIImageView!
    @IBOutlet weak var sunriseLbl: UILabel!
    @IBOutlet weak var sunsetLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var windDirectionLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var barometerLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    var weather: Weather!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a subtle shadow underneath header view
        headerView.layer.shadowColor = UIColor.blackColor().CGColor
        headerView.layer.shadowOffset = CGSizeZero
        headerView.layer.shadowRadius = 3
        headerView.layer.shadowOpacity = 1
        
        // Create our weather object and then
        // fire off web request
        weather = Weather(location: "Bragg City, Mo", zipcode: "63827")
        
        self.refreshData()
    }

    func updateUI() {
        
        // At this point all the data is there, we just need
        // to do some minor manipulation and then update our 
        // labels and image.
        dayLbl.text = "Data from: \(weather.time) \(weather.day)"
        descriptionLbl.text = weather.shortDescription
        temperatureLbl.text = "\(weather.temp)°"
        // Image names in Assets.xcassets all correspond to icon
        // names returned by api.
        weatherIconImg.image = UIImage(named: weather.icon)
        sunriseLbl.text = weather.sunrise
        sunsetLbl.text = weather.sunset
        windSpeedLbl.text = "\(weather.windSpeed)mph"
        windDirectionLbl.text = "\(weather.windDirection)"
        humidityLbl.text = "\(weather.humidity)%"
        barometerLbl.text = "\(weather.pressure)"
        
        updateBackgroundImage()

    }
    @IBAction func updateBtnTapped(sender: UIButton) {
        self.refreshData()
    }
    
    func refreshData() {
        // Show busy spinner
        SwiftSpinner.show("Downloading weather...")
        
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
            
            // Dismiss busy spinner after ui is updated
            SwiftSpinner.hide()
        }
    }
    
    // Depending on conditions (clear, cloudy, rain, snow)
    // update the background.
    func updateBackgroundImage() {
        switch weather.icon {
        case "01d", "01n":
            backgroundImg.image = UIImage(named: "ClearBG")
        case "02d", "02n", "03d", "03n", "04d", "04n":
            backgroundImg.image = UIImage(named: "CloudyBG")
        case "09d", "09n", "10d", "10n", "11d", "11n", "50d", "50n":
            backgroundImg.image = UIImage(named: "RainyBG")
        case "13d", "13n":
            backgroundImg.image = UIImage(named: "SnowyBG")
        default:
            backgroundImg.image = UIImage(named: "ClearBG")
        }
    }
}

