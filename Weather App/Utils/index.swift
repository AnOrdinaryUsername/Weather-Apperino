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

func roundAndRemoveDecimals(_ number: Double) -> String {
    let roundedString = String(format: "%.0f", number.rounded())
    return roundedString
}
