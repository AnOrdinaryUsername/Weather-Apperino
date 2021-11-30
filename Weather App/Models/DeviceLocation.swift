//
//  DeviceLocation.swift
//  Weather App
//
//  Created by Masa, Kyle on 11/23/21.
//

import CoreLocation

class DeviceLocation: NSObject, ObservableObject {
    @Published var weatherData: CurrentWeatherAPI? = nil
    private let currentWeather = CurrentWeather()
    private let manager = CLLocationManager()
    
    var location: CLLocation? {
        didSet {
            if let device = location?.coordinate {
                let place = (device.latitude, device.longitude)
                currentWeather.grabData(at: .geolocation(place)) { currentLocation in
                    self.weatherData = currentLocation
                }
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
        currentWeather.grabData(at: .settlement(city)) {
            searchedCity in
            self.weatherData = searchedCity
        }
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
            currentWeather.grabData(at: .settlement("Bat Cave")) {
                batCave in
                self.weatherData = batCave
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
