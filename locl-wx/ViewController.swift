//
//  ViewController.swift
//  locl-wx
//
//  Created by Jack Davis on 11/15/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import UIKit

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
    
    var weather: Weather!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.layer.shadowColor = UIColor.blackColor().CGColor
        headerView.layer.shadowOffset = CGSizeZero
        headerView.layer.shadowRadius = 3
        headerView.layer.shadowOpacity = 1
        
        weather = Weather(location: "Bragg City, Mo", zipcode: "63827")
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
        }
    }


    func updateUI() {
        dayLbl.text = "\(weather.time) \(weather.day)"
        descriptionLbl.text = weather.shortDescription
        temperatureLbl.text = "\(weather.temp)°"
        weatherIconImg.image = UIImage(named: weather.icon)
        sunriseLbl.text = weather.sunrise
        sunsetLbl.text = weather.sunset
        windSpeedLbl.text = "\(weather.windSpeed)mph"
        windDirectionLbl.text = "\(weather.windDirection)"
        humidityLbl.text = "\(weather.humidity)%"
        barometerLbl.text = "\(weather.pressure)"
        
//        print("Location: \(weather.location)")
//        print("Zip Code: \(weather.zipcode)")
//        print("Day: \(weather.day)")
//        print("Date: \(weather.date)")
//        print("Time: \(weather.time)")
//        print("Station City: \(weather.name)")
//        print("Short Desc: \(weather.shortDescription)")
//        print("Long Desc: \(weather.longDescription)")
//        print("Icon: \(weather.icon)")
//        print("Temperature: \(weather.temp)")
//        print("Pressure: \(weather.pressure)")
//        print("Humidity: \(weather.humidity)")
//        print("Wind Speed: \(weather.windSpeed)")
//        print("Wind Direction: \(weather.windDirection)")
//        print("Sunrise: \(weather.sunrise)")
//        print("Sunset: \(weather.sunset)")

    }
}

