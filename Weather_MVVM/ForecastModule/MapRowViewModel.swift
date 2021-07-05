//
//  MapRowViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 24.03.21.
//  Copyright © 2021 EGS. All rights reserved.
//

import MapKit

struct MapRowViewModel {
    private let item: OWLeadingDTO
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var maxTemperature: String {
        return String(format: "%.1f", item.main.temp_max)
    }
    
    var minTemperature: String {
        return String(format: "%.1f", item.main.temp_min)
    }
    
    var humidity: String {
        return String(format: "%.1f", item.main.humidity)
    }
    
    var coordinate: CLLocationCoordinate2D {
        return .init(latitude: item.coord.lat, longitude: item.coord.lon)
    }
    
    init(item: OWLeadingDTO) {
        self.item = item
    }
}
