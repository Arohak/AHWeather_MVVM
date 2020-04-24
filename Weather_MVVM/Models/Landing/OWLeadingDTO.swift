//
//  OWLeadingDTO.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation

struct OWLeadingDTO: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let main: Main
    let sys: Sys
}

struct Coord: Codable {
    let lat: Double
    let lon: Double
}

struct Main: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Sys: Codable {
    let sunrise: Int
    let sunset: Int
}
