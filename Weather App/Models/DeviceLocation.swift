//
//  DeviceLocation.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/23/21.
//

import CoreLocation

class DeviceLocation: NSObject, ObservableObject {
    @Published var weatherData: CurrentWeatherAPI? = nil
    @Published var forecastData: Forecast? = nil
    @Published var errorMessage: String? = nil
    private let locationWeather = LocationWeather()
    private let manager = CLLocationManager()
    
    var location: CLLocation? {
        didSet {
            self.errorMessage = nil
            if let device = location?.coordinate {
                let place = (device.latitude, device.longitude)
                locationWeather.grabCurrentWeatherData(at: .geolocation(place), callback: { currentLocation in
                    self.weatherData = currentLocation
                }, errorCallback: {
                    error in
                    self.errorMessage = error
                })
                
                locationWeather.grabForecastData(at: place, callback: {
                    forecast in
                    self.forecastData = forecast
                }, errorCallback: {
                    error in
                    self.errorMessage = error
                })
            }
        }
    }
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.distanceFilter = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func getWeather(at city: String) {
        locationWeather.grabCurrentWeatherData(at: .settlement(city), callback: {
            searchedCity in
            self.weatherData = searchedCity
        }, errorCallback: {
            error in
            self.errorMessage = error
        })
        
        locationWeather.grabForecastData(at: (self.weatherData!.coord.lat, self.weatherData!.coord.lon), callback: {
            forecast in
            self.forecastData = forecast
        }, errorCallback: {
            error in
            self.errorMessage = error
        })
    }
}

extension DeviceLocation: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        self.location = lastLocation
    }
    
    // If the user clicks "Do Not Allow" for there current location,
    // show the Bat Cave instead
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .denied) {
            locationWeather.grabCurrentWeatherData(at: .settlement("Bat Cave"), callback: {
                batCave in
                self.weatherData = batCave
            }, errorCallback: {
                error in
                self.errorMessage = error
            })
            
            locationWeather.grabForecastData(at: (self.weatherData!.coord.lat, self.weatherData!.coord.lon), callback: {
                forecast in
                self.forecastData = forecast
            }, errorCallback: {
                error in
                self.errorMessage = error
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
