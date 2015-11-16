//
//  Weather.swift
//  locl-wx
//
//  Created by Jack Davis on 11/15/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _location: String!
    private var _zipcode: String!
    private var _name: String!
    private var _shortDescription: String!
    private var _longDescription: String!
    private var _icon: String!
    private var _date: String!
    private var _time: String!
    private var _sunrise: String!
    private var _sunset: String!
    private var _temp: String!
    private var _humidity: String!
    private var _pressure: String!
    private var _windSpeed: String!
    private var _windDirection: String!
    
    private var _weatherURL: String!
    
    var windSpeed: String {
        get {
            return _windSpeed
        }
    }
    
    var windDirection: String {
        get {
            return _windDirection
        }
    }
    
    var location: String {
        get {
            return _location
        }
    }
    
    var zipcode: String {
        get {
            return _zipcode
        }
    }
    
    var name: String {
        get {
            if _name == nil {
                return ""
            }
            return _name
        }
    }
    
    var shortDescription: String {
        get {
            if _shortDescription == nil {
                return ""
            }
            return _shortDescription
        }
    }
    
    var longDescription: String {
        get {
            if _longDescription == nil {
                return ""
            }
            return _longDescription
        }
    }
    
    var icon: String {
        get {
            if _icon == nil {
                return ""
            }
            return _icon
        }
    }
    
    var date: String {
        get {
            if _date == nil {
                return ""
            }
            return _date
        }
    }
    
    var time: String {
        get {
            if _time == nil {
                return ""
            }
            return _time
        }
    }
    
    var sunrise: String {
        get {
            if _sunrise == nil {
                return ""
            }
            return _sunrise
        }
    }
    
    var sunset: String {
        get {
            if _sunset == nil {
                return ""
            }
            return _sunset
        }
    }
    
    var temp: String {
        get {
            if _temp == nil {
                return ""
            }
            return _temp
        }
    }
    
    var humidity: String {
        get {
            if _humidity == nil {
                return ""
            }
            return _humidity
        }
    }
    
    var pressure: String {
        get {
            if _pressure == nil {
                return ""
            }
            return _pressure
        }
    }
    
    init(location: String, zipcode: String) {
        self._location = "Bragg City, Mo"
        self._zipcode = URL_ZIP
        
        self._weatherURL = "\(URL_BASE)\(self._zipcode)\(URL_UNITS)\(API_KEY)"
    }
    
    func convertMillibarsToInchesOfMercury(pressure: Double) -> Double {
        return pressure * 0.0295333727
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let url = NSURL(string: self._weatherURL)!

        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let dt = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: dt)
                    let dateFormatter = NSDateFormatter()
                    let timeFormatter = NSDateFormatter()
                    dateFormatter.dateFormat = "EEEE"
                    timeFormatter.dateFormat = "h:mma"
                    self._date = dateFormatter.stringFromDate(date)
                    self._time = timeFormatter.stringFromDate(date)
                
                }
                
                if let name = dict["name"] as? String {
                    self._name = name
            
                }
                
                if let weatherDetl = dict["weather"] as? [Dictionary<String, AnyObject>] where weatherDetl.count > 0 {
                    if let shortDesc = weatherDetl[0]["main"] as? String {
                        self._shortDescription = shortDesc
                    }
                    
                    if let longDesc = weatherDetl[0]["description"] as? String {
                        self._longDescription = longDesc
                    }
                    
                    if let icon = weatherDetl[0]["icon"] as? String {
                        self._icon = icon
                    }
                }
                
                if let mainDetl = dict["main"] as? Dictionary<String, AnyObject> {
                    if let tmp = mainDetl["temp"] as? Double {
                        self._temp = NSString(format: "%.0f", tmp) as String
                    }
                    
                    if let pres = mainDetl["pressure"] as? Double {
                        self._pressure = NSString(format: "%.2f", self.convertMillibarsToInchesOfMercury(pres)) as String

                    }
                    
                    if let hum = mainDetl["humidity"] as? Double {
                        self._humidity = NSString(format: "%.0f", hum) as String
                    
                    }
                }
                
                if let windDetl = dict["wind"] as? Dictionary<String, AnyObject> {
                    if let speed = windDetl["speed"] as? Double {
                        self._windSpeed = NSString(format: "%.0f", speed) as String
                        
                    }
                    
                    if let direc = windDetl["deg"] as? Double {
                        self._windDirection = NSString(format: "%.0f", direc) as String
                        
                    }
                }
                
                if let sysDetl = dict["sys"] as? Dictionary<String, AnyObject> {
                    if let sunrise = sysDetl["sunrise"] as? Double {
                        let date = NSDate(timeIntervalSince1970: sunrise)
                        let timeFormatter = NSDateFormatter()
                        timeFormatter.dateFormat = "h:mma"
                        self._sunrise = timeFormatter.stringFromDate(date)
                    }
                    
                    if let sunset = sysDetl["sunset"] as? Double {
                        let date = NSDate(timeIntervalSince1970: sunset)
                        let timeFormatter = NSDateFormatter()
                        timeFormatter.dateFormat = "h:mma"
                        self._sunset = timeFormatter.stringFromDate(date)
                    }
                }
                
            }
            completed()
        }
    }
}


























