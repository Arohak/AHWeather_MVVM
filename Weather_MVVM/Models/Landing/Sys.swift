//
//  Sys.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Sys : Object {
    
    dynamic var sunrise: String!
    dynamic var sunset: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.sunrise    = data["sunrise"].stringValue
        self.sunset     = data["sunset"].stringValue
    }
}