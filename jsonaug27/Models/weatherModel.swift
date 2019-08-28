//
//  weatherModel.swift
//  jsonaug27
//
//  Created by Tia Lendor on 8/27/19.
//  Copyright © 2019 Tia Lendor. All rights reserved.
//

import Foundation
import UIKit

enum WeatherJSON: Error{
    case decodingError(Error)
}

struct Weather: Codable {

    let list: [listInfo]
    
    static func getWeatherData(from data: Data) throws -> [listInfo] {
        do {
            let weather = try JSONDecoder().decode(Weather.self, from: data)
            return weather.list
        } catch {
            throw WeatherJSON.decodingError(error)
        }
    }
    
    

    
}

struct listInfo: Codable {
    let name: String
    let main: mainInfo
    let weather: [weatherInfo]
}

struct mainInfo: Codable {
    let temp: Double
    
}
struct weatherInfo: Codable {
    let main: String
    let description: String
}
