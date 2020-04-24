//
//  LeadingObject.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation
import RealmSwift

class LeadingObject: Object {
    @objc dynamic var id = 0
    @objc dynamic var name: String!
    @objc dynamic var coord: CoordinateObject!
    @objc dynamic var main: MainObject!
    @objc dynamic var sys: SysObject!

    convenience init(data: OWLeadingDTO) {
        self.init()
        
        self.id     = data.id
        self.name   = data.name
        self.main   = MainObject(data: data.main)
        self.coord  = CoordinateObject(data: data.coord)
        self.sys    = SysObject(data: data.sys)
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}

class CoordinateObject: Object {
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var lon: Double = 0.0
    
    convenience init(data: Coord) {
        self.init()
        
        self.lon = data.lon
        self.lat = data.lat
    }
}

class MainObject: Object {
    @objc dynamic var temp: Double = 0.0
    @objc dynamic var tempMin: Double = 0.0
    @objc dynamic var tempMax: Double = 0.0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    
    convenience init(data: Main) {
        self.init()
        
        self.temp       = data.temp
        self.tempMin    = data.temp_min
        self.tempMax    = data.temp_max
        self.pressure   = data.pressure
        self.humidity   = data.humidity
    }
}

class SysObject: Object {
    @objc dynamic var sunrise: Int = 0
    @objc dynamic var sunset: Int = 0
    
    convenience init(data: Sys) {
        self.init()
        
        self.sunrise    = data.sunrise
        self.sunset     = data.sunset
    }
}
