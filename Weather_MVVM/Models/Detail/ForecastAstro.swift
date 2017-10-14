//
//  ForecastAstro.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class ForecastAstro : Object {
    
    dynamic var sunrise: String!
    dynamic var sunset: String!
    dynamic var moonrise: String!
    dynamic var moonset: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.sunrise    = data["sunrise"].stringValue
        self.sunset     = data["sunset"].stringValue
        self.moonrise   = data["moonrise"].stringValue
        self.moonset    = data["moonset"].stringValue
    }
}