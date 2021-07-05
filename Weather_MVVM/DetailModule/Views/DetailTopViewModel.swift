//
//  DetailTopViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

protocol DetailTopViewModelType {
    var cityName: String { get }
    var icon: String { get }
    var title: String { get }
    var temp: String { get }
    var week: String { get }
    var tempAverage: String { get }
}

struct DetailTopViewModel: DetailTopViewModelType {
    let cityName: String
    let icon: String
    let title: String
    let temp: String
    let week: String
    let tempAverage: String

    init(data: DetailObject) {
        
        self.cityName       = data.timezone
        self.icon           = data.current.weather.first!.icon + "@2x.png"
        self.title          = data.current.weather.first!.main
        self.temp           = data.current.temp.celsius
        self.week           = data.current.dateTime.weekDay
        self.tempAverage    = data.daily.first!.temp.max.celsius + "    " + data.daily.first!.temp.min.celsius
    }
}
