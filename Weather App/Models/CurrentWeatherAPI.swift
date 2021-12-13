// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let openWeatherAPI = try? newJSONDecoder().decode(OpenWeatherAPI.self, from: jsonData)

import Foundation

// MARK: - OpenWeatherAPI
struct CurrentWeatherAPI: Codable, Hashable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let name: String
}

// MARK: - Clouds
struct Clouds: Codable, Hashable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable, Hashable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable, Hashable {
    let temp, tempMin, tempMax: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}


// MARK: - Sys
struct Sys: Codable, Hashable {
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable, Hashable {
    let icon: String

    enum CodingKeys: String, CodingKey {
        case icon
    }
}
