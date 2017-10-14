//
//  ForecastDay.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class ForecastDay : Object {
    
    dynamic var date: String!
    dynamic var day: Day!
    dynamic var astro: ForecastAstro!
    var hours = List<ForecastHour>()
    
    convenience init(data: JSON) {
        self.init()
        
        self.date = data["date"].stringValue
        self.day = Day(data: data["day"])
        self.astro = ForecastAstro(data: data["astro"])
        for item in data["hour"].arrayValue { self.hours.append(ForecastHour(data: item)) }
    }
}

class Day : Object {

    dynamic var maxTemp: Double = 0.0
    dynamic var minTemp: Double = 0.0
    dynamic var avgTemp: Double = 0.0
    dynamic var maxWindMph: Double = 0.0
    dynamic var maxWindKph: Double = 0.0
    dynamic var condition: Condition!

    convenience init(data: JSON) {
        self.init()
        
        self.maxTemp    = data["maxtemp_c"].doubleValue
        self.minTemp    = data["mintemp_c"].doubleValue
        self.avgTemp    = data["avgtemp_c"].doubleValue
        self.maxWindMph = data["maxwind_mph"].doubleValue
        self.maxWindKph = data["maxwind_kph"].doubleValue
        self.condition  = Condition(data: data["condition"])
    }
}