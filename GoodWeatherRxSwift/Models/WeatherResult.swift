//
//  WeatherResult.swift
//  GoodWeatherRxSwift
//
//  Created by mohamed  habib on 06/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

let jsonStringWeatherResult = """
{
"coord": {
    "lon": -97.74,
    "lat": 30.27
},
"weather": [
    {
        "id": 801,
        "main": "Clouds",
        "description": "few clouds",
        "icon": "02d"
    }
],
"base": "stations",
"main": {
    "temp": 76.78,
    "feels_like": 83.16,
    "temp_min": 75,
    "temp_max": 78.8,
    "pressure": 1016,
    "humidity": 83
},
"""

struct WeatherResult: Decodable {
    let main: Weather
    
}

extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
    
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
