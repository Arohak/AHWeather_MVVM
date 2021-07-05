//
//  LandingCellModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import CoreLocation

protocol CityNameModelType {
    var name: String { get }
}

protocol CityCoordinateModelType {
    var coord: CLLocationCoordinate2D { get }
}

protocol MainModelType {
    var temp: String { get }
    var pressure: String { get }
    var humidity: String { get }
    var tempMin: String { get }
    var tempMax: String { get }
}
    
protocol SysModelType {
    var sunrise: String { get }
    var sunset: String { get }
}

protocol LandingCellModelType: CityNameModelType, CityCoordinateModelType, MainModelType, SysModelType {
}

struct LandingCellModel: LandingCellModelType {
    let name: String
    let temp: String
    let pressure: String
    let humidity: String
    let tempMin: String
    let tempMax: String
    let sunrise: String
    let sunset: String
    let coord: CLLocationCoordinate2D
    
    init(city: LeadingObject) {
        self.name       = city.name
        self.temp       = city.main.temp.celsius
        self.pressure   = city.main.pressure.hPa
        self.humidity   = city.main.humidity.percent
        self.tempMin    = city.main.tempMin.celsius
        self.tempMax    = city.main.tempMax.celsius
        self.sunrise    = city.sys.sunrise.shortTime
        self.sunset     = city.sys.sunset.shortTime
        self.coord      = CLLocationCoordinate2D(latitude: city.coord.lat, longitude: city.coord.lon)
    }
}
