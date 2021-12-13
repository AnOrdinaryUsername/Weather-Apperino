//
//  LocationManager.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/11/21.
//

import Foundation
import CoreLocation

typealias Geolocation = (latitude: Double, longitude: Double)

enum Location {
    case geolocation(Geolocation)
    case settlement(String)
}

class LocationWeather {
    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    private let apiKey = "&appid=9d958a66e735735b56e66b55bba5ada5&units=imperial"
    
    func grabCurrentWeatherData(at place: Location, callback: @escaping (CurrentWeatherAPI) -> ()) {
        var url: URL
        
        switch place {
        case .geolocation(let geoCoords):
            let (latitude, longitude) = geoCoords
            let apiUrl = "\(baseUrl)weather?lat=\(latitude)&lon=\(longitude)\(apiKey)"
            url = URL(string: apiUrl)!
           

        case .settlement(let area):
            let areaWithNoSpaces = area.replacingOccurrences(of: " ", with: "%20")
            let apiUrl = "\(baseUrl)weather?q=\(areaWithNoSpaces)\(apiKey)"
            print(apiUrl)
            url = URL(string: apiUrl)!
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
                    do {
                        if let postData = data {
                            let decodedData = try JSONDecoder().decode(CurrentWeatherAPI.self, from: postData)
                            DispatchQueue.main.sync {
                                callback(decodedData)
                            }
                        } else {
                            print("No data")
                        }
                    } catch {
                        print(String(describing: error))
                    }
        }.resume()
    }
    
    func grabForecastData(at geoCoords: Geolocation, callback: @escaping (Forecast) -> ()) {
        let (latitude, longitude) = geoCoords
        let apiUrl = URL(string: "\(baseUrl)onecall?lat=\(latitude)&lon=\(longitude)&exclude=current,minutely,alerts\(apiKey)")!
        
        let task = URLSession.shared.dataTask(with: apiUrl, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong")
                return
            }
            
            // have data
            do {
                let result = try JSONDecoder().decode(Forecast.self, from: data)
                DispatchQueue.main.sync {
                    callback(result)
                }
            }
            catch {
                print(String(describing: error))
            }
        })
        task.resume()
        
    }

}
