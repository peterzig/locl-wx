//
//  Constants.swift
//  locl-wx
//
//  Created by Jack Davis on 11/15/15.
//  Copyright © 2015 Nine42 LLC. All rights reserved.
//

import Foundation

// Request url format for current conditions (Bragg City, MO - 63827)
// http://api.openweathermap.org/data/2.5/weather?zip=63827,us&units=imperial&appid=ffebf1bbc2f40c972b0936bf2d56fb06

public let URL_BASE = "http://api.openweathermap.org/data/2.5/weather?zip="
//public let URL_ZIP = "63827"
public let URL_UNITS = ",us&units=imperial&appid="
public let API_KEY = "ffebf1bbc2f40c972b0936bf2d56fb06"

typealias DownloadComplete = () -> ()
