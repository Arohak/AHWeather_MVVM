//
//  DetailDayCellModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

import RxSwift

protocol DetailDayCellModelType {
    var title: String { get }
    var iconImage: String { get }
    var temp: String { get }
    var hours: [DetailTimeCellModelType] { get }
}

struct DetailDayCellModel: DetailDayCellModelType {

    let title: String
    let iconImage: String
    let temp: String
    var hours = [DetailTimeCellModelType]()

    init(forecastDay: ForecastDay) {
        self.title      = forecastDay.date.weekDay
        self.iconImage  = "http:" + forecastDay.day.condition.icon
        self.temp       = forecastDay.day.maxTemp.celsius + "    " + forecastDay.day.minTemp.celsius
        for item in forecastDay.hours {
            self.hours.append(DetailTimeCellModel(forecastHour: item))
        }
    }
}
