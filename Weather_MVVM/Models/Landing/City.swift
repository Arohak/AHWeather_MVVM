//
//  City.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON


class City : Object {
    
    dynamic var id = 0
    dynamic var name: String!
    dynamic var weather: Weather!
    dynamic var main: Main!
    dynamic var coordinate: Coordinate!
    dynamic var sys: Sys!

    convenience init(data: JSON) {
        self.init()
        
        self.id         = data["id"].intValue
        self.name       = data["name"].stringValue
        self.main       = Main(data: data["main"])
        self.coordinate = Coordinate(data: data["coord"])
        self.sys        = Sys(data: data["sys"])

        let weathers    = data["weather"].arrayValue
        if let weather  = weathers.first {
            self.weather    = Weather(data: weather)
        } else {
           self.weather = Weather(data: JSON.null)
        }
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}
