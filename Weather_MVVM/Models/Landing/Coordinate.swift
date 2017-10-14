//
//  Coordinate.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Coordinate : Object {
    
    dynamic var lat: String!
    dynamic var lon: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.lon = data["lon"].stringValue
        self.lat = data["lat"].stringValue
    }
}