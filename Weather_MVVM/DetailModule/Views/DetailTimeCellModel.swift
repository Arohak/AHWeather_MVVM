//
//  DetailTimeCellModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

protocol DetailTimeCellModelType {
    var time: String { get }
    var icon: String { get }
    var temp: String { get }
}

struct DetailTimeCellModel: DetailTimeCellModelType {
    let time: String
    let icon: String
    let temp: String
    
    init(data: HourlyObject) {
        self.time   = data.dateTime.hour_
        self.icon   = data.weather.first!.icon + ".png"
        self.temp   = data.temp.celsius
    }
}
