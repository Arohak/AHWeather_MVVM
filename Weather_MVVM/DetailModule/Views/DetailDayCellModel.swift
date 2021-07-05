//
//  DetailDayCellModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import RealmSwift

protocol DetailDayCellModelType {
    var title: String { get }
    var icon: String { get }
    var temp: String { get }
    var hours: [DetailTimeCellModelType] { get }
}

struct DetailDayCellModel: DetailDayCellModelType {
    let title: String
    let icon: String
    let temp: String
    var hours = [DetailTimeCellModelType]()

    init(day: DailyObject, hours: List<HourlyObject>) {
        self.title  = day.dateTime.weekDay
        self.icon   = day.weather.first!.icon + ".png"
        self.temp   = day.temp.max.celsius + "    " + day.temp.min.celsius
        self.hours  = hours.map { DetailTimeCellModel(data: $0) }
    }
}
