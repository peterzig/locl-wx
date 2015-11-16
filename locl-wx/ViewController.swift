//
//  ViewController.swift
//  locl-wx
//
//  Created by Jack Davis on 11/15/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var weather: Weather!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather = Weather(location: "Bragg City, Mo", zipcode: "63827")
        weather.downloadWeatherDetails { () -> () in
            self.updateUI()
        }
    }


    func updateUI() {

        print("Location: \(weather.location)")
        print("Zip Code: \(weather.zipcode)")
        print("Day: \(weather.date)")
        print("Time: \(weather.time)")
        print("Station City: \(weather.name)")
        print("Short Desc: \(weather.shortDescription)")
        print("Long Desc: \(weather.longDescription)")
        print("Icon: \(weather.icon)")
        print("Temperature: \(weather.temp)")
        print("Pressure: \(weather.pressure)")
        print("Humidity: \(weather.humidity)")
        print("Wind Speed: \(weather.windSpeed)")
        print("Wind Direction: \(weather.windDirection)")
        print("Sunrise: \(weather.sunrise)")
        print("Sunset: \(weather.sunset)")

    }
}

