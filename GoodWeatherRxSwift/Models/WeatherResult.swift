//
//  WeatherResult.swift
//  GoodWeatherRxSwift
//
//  Created by mohamed  habib on 06/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

struct WeatherResult: Decodable {
    let main: Weather
    
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
