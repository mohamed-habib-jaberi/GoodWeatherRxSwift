//
//  URLRequest+Extensions.swift
//  GoodWeatherRxSwift
//
//  Created by mohamed  habib on 06/08/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct Ressource<T> {
    let url: URL
}

extension URLRequest {
    
    static func load<T: Decodable>(ressource: Ressource<T>) -> Observable<T>{
        
        return Observable.from([ressource.url])
            .flatMap { (url) -> Observable<Data> in
                
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
        }.map { (data) -> T in
            
            try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
        
    }
    
}
