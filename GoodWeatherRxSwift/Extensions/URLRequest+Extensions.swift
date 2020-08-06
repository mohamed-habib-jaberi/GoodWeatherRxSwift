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
    
    // implementing load function that take in consideration the status code that return
    
    static func load<T: Decodable>(ressource: Ressource<T>) -> Observable<T>{
        
        return Observable.just(ressource.url)
            .flatMap { (url) -> Observable<(response: HTTPURLResponse, data: Data)> in
                
                let request = URLRequest(url: url)
                return URLSession.shared.rx.response(request: request)
                
        }.map { response, data -> T in
            
            if 200..<300 ~= response.statusCode {
                return   try JSONDecoder().decode(T.self, from: data)
            }else {
                throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
            }
            
        }.asObservable()
        
    }
    
    //    static func load<T: Decodable>(ressource: Ressource<T>) -> Observable<T>{
    //
    //        return Observable.from([ressource.url])
    //            .flatMap { (url) -> Observable<Data> in
    //
    //                let request = URLRequest(url: url)
    //                return URLSession.shared.rx.data(request: request)
    //        }.map { (data) -> T in
    //
    //            try JSONDecoder().decode(T.self, from: data)
    //        }.asObservable()
    //
    //    }
    
}
