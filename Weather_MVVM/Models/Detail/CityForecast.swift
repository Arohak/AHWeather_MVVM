//
//  CityForecast.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class CityForecast : Object {
    
    dynamic var name = ""
    dynamic var location: Location!
    dynamic var current: Current!
    var forecastDays = List<ForecastDay>()

    convenience init(data: JSON) {
        self.init()
        
        self.location   = Location(data: data["location"])
        self.current    = Current(data: data["current"])
        self.name       = location.name

        for item in data["forecast"]["forecastday"].arrayValue {
            self.forecastDays.append(ForecastDay(data: item))
        }
    }
    
    override static func primaryKey() -> String {
        return "name"
    }
}

class Location : Object {
    
    dynamic var name: String!
    dynamic var lat: Double = 0.0
    dynamic var lon: Double = 0.0
    dynamic var localTime: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.name       = data["name"].stringValue
        self.lon        = data["lon"].doubleValue
        self.lat        = data["lat"].doubleValue
        self.localTime  = data["localtime"].stringValue
    }
}

class Current : Object {
    
    dynamic var lastUpdated: String!
    dynamic var tempC: Double = 0.0
    dynamic var tempF: Double = 0.0
    dynamic var mphW: Double = 0.0
    dynamic var kphW: Double = 0.0
    dynamic var mbP: Double = 0.0
    dynamic var inP: Double = 0.0
    dynamic var feelslikeC: Double = 0.0
    dynamic var feelslikeF: Double = 0.0
    dynamic var condition: Condition!
    
    convenience init(data: JSON) {
        self.init()
        
        self.lastUpdated    = data["last_updated"].stringValue
        self.tempC          = data["temp_c"].doubleValue
        self.tempF          = data["temp_f"].doubleValue
        self.mphW           = data["wind_mph"].doubleValue
        self.kphW           = data["wind_kph"].doubleValue
        self.mbP            = data["pressure_mb"].doubleValue
        self.inP            = data["pressure_in"].doubleValue
        self.feelslikeC     = data["feelslike_c"].doubleValue
        self.feelslikeF     = data["feelslike_f"].doubleValue
        self.condition      = Condition(data: data["condition"])
    }
}

class Condition : Object {
    
    dynamic var text: String!
    dynamic var icon: String!
    dynamic var code: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.text = data["text"].stringValue
        self.icon = data["icon"].stringValue
        self.code = data["code"].stringValue
    }
}