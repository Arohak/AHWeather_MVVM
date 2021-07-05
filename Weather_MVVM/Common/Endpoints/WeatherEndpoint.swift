//
//  WeatherEndpoint.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 01.04.21.
//  Copyright © 2021 EGS. All rights reserved.
//

import Foundation
import CoreLocation
import APIClient

enum WeatherEndpoint {
    case leading(city: String)
    case detail(coord: CLLocationCoordinate2D)
    case forecast(city: String)
}

extension WeatherEndpoint: APIClient {
    var baseUrl: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5")!
    }
    
    var path: String {
        switch self {
        case .leading:  return "/weather"
        case .detail:   return "/onecall"
        case .forecast: return "/forecast"
        }
    }
    
    var queryItems: [URLQueryItem] {
        var temp: [String: String] = ["APPID": "848c6f714deb2219816b686306bc766d", "units": "metric"]
        switch self {
        case .leading(let city), .forecast(let city):
            temp["q"] = city
        case .detail(let coord):
            temp["lat"] = "\(coord.latitude)"
            temp["lon"] = "\(coord.longitude)"
        }
        return temp.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
