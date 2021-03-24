//
//  ForecastRow.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 13.03.21.
//  Copyright © 2021 AroHak. All rights reserved.
//

import Foundation

struct ForecastRow: Identifiable {
    private let item: ForecastDTO.Item
    
    var id: String {
        return day + temperature + title
    }
    
    var day: String {
        return dayFormatter.string(from: item.dt)
    }
    
    var month: String {
        return monthFormatter.string(from: item.dt)
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var title: String {
        guard let title = item.weather.first?.main.rawValue else { return "" }
        return title
    }
    
    var fullDescription: String {
        guard let description = item.weather.first?.weatherDescription else { return "" }
        return description
    }
    
    init(item: ForecastDTO.Item) {
        self.item = item
    }
    
    let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }()
}

extension ForecastRow: Hashable {
  static func == (lhs: ForecastRow, rhs: ForecastRow) -> Bool {
    return lhs.day == rhs.day
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(day)
  }
}
