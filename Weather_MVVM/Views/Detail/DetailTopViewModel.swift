//
//  DetailTopViewModel.swift
//  Weather_MVVM
//
//  Created by Test on 8/16/16.
//  Copyright © 2016 EGS. All rights reserved.
//

protocol DetailTopViewModelType {
    var cityName: String { get }
    var iconImage: String { get }
    var title: String { get }
    var temp: String { get }
    var week: String { get }
    var tempAverage: String { get }
}

struct DetailTopViewModel: DetailTopViewModelType {

    let cityName: String
    let iconImage: String
    let title: String
    let temp: String
    let week: String
    let tempAverage: String

    init(city: CityForecast) {
        self.cityName       = city.name
        self.iconImage      = "http:" + city.current.condition.icon
        self.title          = city.current.condition.text
        self.temp           = city.current.tempC.celsius
        self.week           = city.forecastDays.first!.date.weekDay
        self.tempAverage    = city.forecastDays.first!.day.maxTemp.celsius + "    " + city.forecastDays.first!.day.minTemp.celsius
    }

}
