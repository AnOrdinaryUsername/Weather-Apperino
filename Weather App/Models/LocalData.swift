//
//  LocalData.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import Foundation

struct JSONData: Codable, Hashable {
    let forecast: Forecast
    let currentWeather: CurrentWeatherAPI
    
    enum CodingKeys: String, CodingKey {
            case forecast, currentWeather
    }
}

let FILE_NAME = "weatherData.json"

class LocalData: NSObject, ObservableObject {
    @Published var storage: [JSONData]
    
    override init() {
        self.storage = {
        do {
                let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    .appendingPathComponent(FILE_NAME)

                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let items = try decoder.decode([JSONData].self, from: data)
                return items
            } catch {
                print(error.localizedDescription)
                return []
            }
        }()
        super.init()
    }
    
    func saveLocationWeather(_ forecastInfo: Forecast, _ currentWeatherInfo: CurrentWeatherAPI) {
        // Okay, this makes an unnecessary copy but I couldn't
        // think of a way to update the JSON file after appending
        // an item to storage.
        // TODO: Fix later.
        let newItem = (JSONData(forecast: forecastInfo, currentWeather: currentWeatherInfo))
        var copyOfStorage = self.storage
        copyOfStorage.append(newItem)
        writeToJSON(items: copyOfStorage, newItem: newItem)
    }
    
    func deleteLocationWeather(index position: Int) -> Void {
        var copyOfStorage = self.storage
        copyOfStorage.remove(at: position)
        writeToJSON(items: copyOfStorage, newItem: nil)
    }
    
    private func writeToJSON(items: [JSONData], newItem: JSONData?) {
        do {
            let fileURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(FILE_NAME)

            let encoder = JSONEncoder()
            try encoder.encode(self.storage).write(to: fileURL)
            if let item = newItem {
                self.storage.append(item)
            } else {
                self.storage = items
            }
        } catch {
            print(error)
        }
    }
}
