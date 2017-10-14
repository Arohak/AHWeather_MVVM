//
//  Weather.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift
import SwiftyJSON

class Weather : Object {
    
    dynamic var main: String!
    dynamic var desc: String!
    dynamic var icon: String!
    
    convenience init(data: JSON) {
        self.init()
        
        self.main = data["main"].stringValue
        self.desc = data["description"].stringValue
        self.icon = data["icon"].stringValue
    }
}
