//
//  weatherModel.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation

enum WeatherJSON: Error{
    case decodingError(Error)
}

struct Weather: Codable {
    let cityName: String
    let currentTemp: Int
    
    static func getWeatherData(from data: Data) throws -> [Weather] {
        do {
            let weather = try
                JSONDecoder().decode([Weather].self, from: data)
            return weather
        } catch {
            throw WeatherJSON.decodingError(error)
        }
    }
    
}
