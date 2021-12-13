//
//  Forecast.swift
//  Weather App
//
//  Created by Kevin Loi on 12/6/21.
//

import Foundation


//let url = "https://api.openweathermap.org/data/2.5/onecall?lat=35.4515&lon=-82.2871&exclude=current,minutely,alerts&units=imperial&appid=9d958a66e735735b56e66b55bba5ada5"

var latitude: Double?
var longitude: Double?

let baseURL = "https://api.openweathermap.org/data/2.5/onecall"
let areaWithNoSpaces = "?lat=\(latitude)&lon=\(longitude)"
let apiKey = "imperial&appid=7da6d65192a91313e2d8bf49ef2c7533"

let Url = "\(baseURL)\(areaWithNoSpaces)&exclude=current,minutely,alerts&units=\(apiKey)"

// MARK: - Forecast
struct Forecast: Codable {
    let lat, lon: Double
    let hourly: [Hourly]
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon
        case hourly, daily
    }
}

// MARK: - Daily
struct Daily: Codable, Hashable {
    let dt: Int
    let temp: Temp

    enum CodingKeys: String, CodingKey {
        case dt
        case temp
    }
}

// MARK: - Temp
struct Temp: Codable, Hashable {
    let day: Double
}

// MARK: - Hourly
struct Hourly: Codable, Hashable {
    let dt: Int
    let temp: Double
}

