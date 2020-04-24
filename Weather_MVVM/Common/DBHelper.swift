//
//  DBHelper.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import CoreLocation
import RealmSwift

enum DBHelper {
        
    static let realm = try! Realm()
    
    //MARK: - Leading -
    static var cities: Results<LeadingObject> {
        let cities = realm.objects(LeadingObject.self)
        return cities
    }
    
    static func store(city: LeadingObject) {
        try! realm.write {
            realm.add(city, update: .all)
        }
    }
    
    //MARK: - Detail -
    static func getForecast(for coord: CLLocationCoordinate2D) -> Results<DetailObject> {
        let cities = realm.objects(DetailObject.self).filter("lat = %@ AND lon = %@", coord.latitude, coord.longitude)
        return cities
    }
    
    static func storeCity(forecast: DetailObject) {
        try! realm.write {
            realm.add(forecast, update: .all)
        }
    }
}
