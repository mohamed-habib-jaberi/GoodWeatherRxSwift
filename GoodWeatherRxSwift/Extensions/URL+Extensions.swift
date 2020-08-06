//
//  URL+Extensions.swift
//  GoodWeatherRxSwift
//
//  Created by mohamed  habib on 06/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation


extension URL {
    
    static func urlForWeatherAPI(city: String ) -> URL? {
        
        return URL(string: "https://openweathermap.org/data/2.5/weather?q=\(city)&appid=439d4b804bc8187953eb36d2a8c26a02&units=imperial")
        
    }
    
}
