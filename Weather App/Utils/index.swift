//
//  index.swift
//  Weather App
//
//  Created by Masa, Kyle on 12/12/21.
//

import Foundation

func createReadableDate(_ unixTimestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTimestamp))
    let dateFormatter = DateFormatter()
    
    dateFormatter.dateFormat = "MM/dd/YY"
    let formattedDate = dateFormatter.string(from: date)
    
    return formattedDate
}

func convertToHourly(_ unixTimestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTimestamp))
    let dateFormatter = DateFormatter()
    
    dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
    dateFormatter.timeZone = .current
    
    let localDate = dateFormatter.string(from: date)
    return localDate
}

// https://stackoverflow.com/a/51165535
func convertToDay(_ unixTimestamp: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(unixTimestamp))
    var cal = Calendar(identifier: .gregorian)
    
    if let tz = TimeZone(identifier:  TimeZone.current.identifier) {
                cal.timeZone = tz
            }
            // Get the weekday for the given timezone.
            // Subtract 1 to convert from 1-7 to 0-6
            // Normalize to 0-6 using % 7
            let weekday = (cal.component(.weekday, from: date)  - 1) % 7

            // Get the weekday name for the user's locale
            return Calendar.current.weekdaySymbols[weekday]
}

func roundAndRemoveDecimals(_ number: Double) -> String {
    let roundedString = String(format: "%.0f", number.rounded())
    return roundedString
}
