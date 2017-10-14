//
//  ForecastHour.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class ForecastHour : Object {
    
    dynamic var time: String!
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
        
        self.time       = data["time"].stringValue
        self.tempC      = data["temp_c"].doubleValue
        self.tempF      = data["temp_f"].doubleValue
        self.mphW       = data["wind_mph"].doubleValue
        self.kphW       = data["wind_kph"].doubleValue
        self.mbP        = data["pressure_mb"].doubleValue
        self.inP        = data["pressure_in"].doubleValue
        self.feelslikeC = data["feelslike_c"].doubleValue
        self.feelslikeF = data["feelslike_f"].doubleValue
        self.condition  = Condition(data: data["condition"])
    }
}
