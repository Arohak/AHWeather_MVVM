//
//  LandingCellModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

protocol CityNameModelType {
    var name: String { get }
}

protocol WeatherModelType {
    var main: String { get }
    var desc: String { get }
    var icon: String { get }
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

protocol LandingCellModelType: CityNameModelType, WeatherModelType, MainModelType, SysModelType {
}

struct LandingCellModel: LandingCellModelType {
    
    let name: String
    let main: String
    let desc: String
    let icon: String
    let temp: String
    let pressure: String
    let humidity: String
    let tempMin: String
    let tempMax: String
    let sunrise: String
    let sunset: String
    
    init(city: City) {
        
        self.name       = city.name
        self.main       = city.weather.main
        self.desc       = city.weather.desc
        self.icon       = city.weather.icon
        self.temp       = city.main.temp.celsius
        self.pressure   = city.main.pressure.hPa
        self.humidity   = city.main.humidity.percent
        self.tempMin    = city.main.tempMin.celsius
        self.tempMax    = city.main.tempMax.celsius
        self.sunrise    = city.sys.sunrise.shortTime
        self.sunset     = city.sys.sunset.shortTime
    }

}
