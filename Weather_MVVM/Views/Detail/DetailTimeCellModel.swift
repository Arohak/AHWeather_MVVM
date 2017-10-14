//
//  DetailTimeCellModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

protocol DetailTimeCellModelType {
    var time: String { get }
    var iconImage: String { get }
    var temp: String { get }
}

struct DetailTimeCellModel: DetailTimeCellModelType {

    let time: String
    let iconImage: String
    let temp: String
    
    init(forecastHour: ForecastHour) {
        self.time       = forecastHour.time.hour
        self.iconImage  = "http:" + forecastHour.condition.icon
        self.temp       = forecastHour.tempC.celsius
    }
}
