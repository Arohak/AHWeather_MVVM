//
//  Main.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Main : Object {
    
    dynamic var temp: Double = 0.0
    dynamic var tempMin: Double = 0.0
    dynamic var tempMax: Double = 0.0
    dynamic var pressure: Double = 0.0
    dynamic var humidity: Double = 0.0
    
    convenience init(data: JSON) {
        self.init()
        
        self.temp       = data["temp"].doubleValue
        self.tempMin    = data["temp_min"].doubleValue
        self.tempMax    = data["temp_max"].doubleValue
        self.pressure   = data["pressure"].doubleValue
        self.humidity   = data["humidity"].doubleValue
    }
}