//
//  DetailObject.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 4/23/20.
//  Copyright © 2020 EGS. All rights reserved.
//

import Foundation
import RealmSwift

class DetailObject: Object {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lon: Double = 0
    @objc dynamic var timezone: String!
    @objc dynamic var current: CurrentObject!
    dynamic var daily = List<DailyObject>()
    dynamic var hourly = List<HourlyObject>()

    convenience init(data: OWDetailDTO) {
        self.init()
        
        self.lat        = data.lat
        self.lon        = data.lon
        self.timezone   = data.timezone
        self.current    = CurrentObject(data: data.current)
        _ = data.daily.map { self.daily.append(DailyObject(data: $0)) }
        _ = data.hourly.map { self.hourly.append(HourlyObject(data: $0)) }
    }
    
    convenience init(data: YandexDetailDTO) {
        self.init()
        
    }
    
    override static func primaryKey() -> String {
        return "timezone"
    }
}

class CurrentObject: Object {
    @objc dynamic var dateTime: Int = 0
    @objc dynamic var temp: Double = 0
    @objc dynamic var dewPoint: Double = 0
    @objc dynamic var uvi: Double = 0
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    dynamic var weather = List<WeatherObject>()
    
    convenience init(data: Current) {
        self.init()
        
        self.dateTime   = data.dt
        self.temp       = data.temp
        self.dewPoint   = data.dewPoint
        self.uvi        = data.uvi
        self.sunrise    = data.sunrise
        self.sunset     = data.sunset
        self.pressure   = data.pressure
        self.humidity   = data.humidity
        _ = data.weather.map { self.weather.append(WeatherObject(data: $0)) }
    }
}

class DailyObject: Object {
    @objc dynamic var dateTime: Int = 0
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var temp: TempObject!
    @objc dynamic var feelsLike: FeelsLikeObject!
    dynamic var weather = List<WeatherObject>()
    
    convenience init(data: Daily) {
        self.init()
        
        self.dateTime   = data.dt
        self.sunrise    = data.sunrise
        self.sunset     = data.sunset
        self.pressure   = data.pressure
        self.humidity   = data.humidity
        self.temp       = TempObject(data: data.temp)
        self.feelsLike  = FeelsLikeObject(data: data.feelsLike)
        _ = data.weather.map { self.weather.append(WeatherObject(data: $0)) }
    }
}

class FeelsLikeObject: Object {
    @objc dynamic var day: Double = 0
    @objc dynamic var night: Double = 0
    @objc dynamic var eve: Double = 0
    @objc dynamic var morn: Double = 0
    
    convenience init(data: Daily.FeelsLike) {
        self.init()
        
        self.day    = data.day
        self.night  = data.night
        self.eve    = data.eve
        self.morn   = data.morn
    }
}

class TempObject: Object {
    @objc dynamic var day: Double = 0
    @objc dynamic var min: Double = 0
    @objc dynamic var max: Double = 0
    @objc dynamic var night: Double = 0
    @objc dynamic var eve: Double = 0
    @objc dynamic var morn: Double = 0

    convenience init(data: Daily.Temp) {
        self.init()
        
        self.day    = data.day
        self.min    = data.min
        self.max    = data.max
        self.night  = data.night
        self.eve    = data.eve
        self.morn   = data.morn
    }
}

class HourlyObject: Object {
    @objc dynamic var dateTime: Int = 0
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    dynamic var weather = List<WeatherObject>()
    
    convenience init(data: Hourly) {
        self.init()
        
        self.dateTime   = data.dt
        self.temp       = data.temp
        self.feelsLike  = data.feelsLike
        self.pressure   = data.pressure
        self.humidity   = data.humidity
        _ = data.weather.map { self.weather.append(WeatherObject(data: $0)) }
    }
}

class WeatherObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var desc: String!
    @objc dynamic var main: String!
    @objc dynamic var icon: String!

    convenience init(data: Weather) {
        self.init()
        
        self.id     = data.id
        self.desc   = data.description
        self.main   = data.main
        self.icon   = Agent.imageOWPath + data.icon
    }
}
