//
//  WeatherM.swift
//  Profile
//  Created by Студент on 15.11.2023.
//

import Foundation

struct Current: Codable {
    var cloudcover: Int // = 0
    var feelslike: Int // = 18
    var humidity: Int // = 34
    var is_day: String // = "yes"
    var observation_time: String // = "10:55 AM"
    var precip: Int // = 0
    var pressure: Int // = 1014
    var temperature: Int // = 18
    var uv_index: Int // = 5
    var visibility: Int // = 10
    var weather_code: Int // = 113
    var weather_descriptions: [String] // = [ "Sunny" ]
    var weather_icons: [String] // = [ "https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png" ]
    var wind_degree: Int // = 350
    var wind_dir: String // = "N"
    var wind_speed: Int // = 22
}

struct Location: Codable {
    var country: String // = "Italy"
    var lat: String // = "41.900"
    var localtime: String // = "2021-10-15 12:55"
    var localtime_epoch: Int // = 1634302500
    var lon: String // = "12.483"
    var name: String // = "Rome"
    var region: String // = "Lazio"
    var timezone_id: String // = "Europe/Rome"
    var utc_offset: String // = "2.0"
}

struct Request: Codable {
    var language: String // = "en"
    var query: String // = "Rome, Italy"
    var type: String // = "City"
    var unit: String // = "m"
}

struct WeatherCity: Codable {
    var current : Current
    var location : Location
    var request : Request
}
