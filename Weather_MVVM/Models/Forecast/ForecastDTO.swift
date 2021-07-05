//
//  ForecastDTO.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 13.03.21.
//  Copyright © 2021 AroHak. All rights reserved.
//

import Foundation

//struct ForecastDTO: Codable {
//    let list: [Item]
//
//    struct Item: Codable {
//        let dt: Date
//        let main: MainClass
//        let weather: [Weather]
//    }
//
//    struct MainClass: Codable {
//        let temp: Double
//    }
//
//    struct Weather: Codable {
//        let main: MainEnum
//        let weatherDescription: String
//
//        enum CodingKeys: String, CodingKey {
//            case main
//            case weatherDescription = "description"
//        }
//
//        enum MainEnum: String, Codable {
//            case clear = "Clear"
//            case clouds = "Clouds"
//            case rain = "Rain"
//        }
//    }
//}

struct ForecastDTO: Codable {
    let list: [Item]
    
    struct Item: Codable {
        let dt: Date
        let main: MainClass
        let weather: [Weather]
    }
    
    struct MainClass: Codable {
        let temp: Double
    }
    
    struct Weather: Codable {
        let main: MainEnum
        let weatherDescription: String
        
        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
        
        enum MainEnum: String, Codable {
            case clear = "Clear"
            case clouds = "Clouds"
            case rain = "Rain"
        }
    }
}
