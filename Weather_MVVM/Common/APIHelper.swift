//
//  APIHelper.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

/// open weather
/// https://openweathermap.org/api/one-call-api

/// yandex
/// https://yandex.ru/dev/weather/doc/dg/concepts/forecast-info-docpage/
/// https://developer.tech.yandex.ru/services/18/
/// https://api.weather.yandex.ru/v1/forecast?lat=55.75396&lon=37.620393&extra=false


import Foundation
import CoreLocation
import Combine
import SwiftSpinner

public enum HttpMethod : String {
    case get, post, put, patch, delete
    
    var string: String {
        return self.rawValue.uppercased()
    }
}

public protocol Request {
    var method: HttpMethod          { get }
    var baseURL: URL                { get }
    var path: String                { get }
    var params: [URLQueryItem]?     { get }
    var headers: [String: String]?  { get }
}

struct Agent {
    static let imageOWPath = "http://openweathermap.org/img/wn/"
    
    static let networkActivityPublisher = PassthroughSubject<Bool, Never>()

    static func run<T: Decodable>(_ request: Request) -> AnyPublisher<T, Error> {
        var urlComponents = URLComponents()
        urlComponents.scheme = request.baseURL.scheme
        urlComponents.queryItems = request.params
        urlComponents.host = request.baseURL.host
        urlComponents.path = request.baseURL.path + request.path
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.method.string
        urlRequest.allHTTPHeaderFields = request.headers
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .handleEvents(receiveSubscription: { _ in
                SwiftSpinner.show("Loading Data...")
                networkActivityPublisher.send(true)
            }, receiveOutput: {
                print(NSString(data: $0, encoding: String.Encoding.utf8.rawValue)!)
            }, receiveCompletion: { _ in
                networkActivityPublisher.send(false)
                SwiftSpinner.hide()
            }, receiveCancel: {
                networkActivityPublisher.send(false)
                SwiftSpinner.hide()
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum WeatherAPI {
    case leading(city: String)
    case detail(coord: CLLocationCoordinate2D)
}

extension WeatherAPI: Request {
    var method: HttpMethod {
        return .get
    }
    
    var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .leading:  return "/weather"
        case .detail:   return "/onecall"
        }
    }
    
    var params: [URLQueryItem]? {
        var temp: [String: String] = ["APPID": "848c6f714deb2219816b686306bc766d", "units": "metric"]
        switch self {
        case .leading(let city):
            temp["q"] = city
        case .detail(let coord):
            temp["lat"] = "\(coord.latitude)"
            temp["lon"] = "\(coord.longitude)"
        }
        return temp.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
