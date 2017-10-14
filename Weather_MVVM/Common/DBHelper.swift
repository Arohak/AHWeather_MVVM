//
//  DBHelper.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RealmSwift

let dbHelper = DBHelper.sharedInstance

class DBHelper {
    
    static let sharedInstance = DBHelper()
    var realm: Realm!
    
    private init() {
        realm = try! Realm()
    }
    
    //MARK: - Weather -
    func getStoredCities() -> Results<City> {
        let cities = realm.objects(City.self)
        
        return cities
    }
    
    func storeCity(item: City) {
        try! realm.write {
            let item1 = realm.create(City.self, value: item, update: true)
            realm.add(item1)
        }
    }
    
    //MARK: - Weather Forecast -
    func getStoredCityForecast(city: String) -> Results<CityForecast> {
        let cities = realm.objects(CityForecast).filter("name == %@", city)
        
        return cities
    }
    
    func storeCityForecast(item: CityForecast) {
        try! realm.write {
            let city = realm.create(CityForecast.self, value: item, update: true)
            realm.add(city)
        }
    }
}
