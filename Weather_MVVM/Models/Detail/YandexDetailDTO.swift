//
//  YandexDetailDTO.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 4/23/20.
//  Copyright © 2020 EGS. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct YandexDetailDTO: Codable {
    let lat, lon: Double
    let timezone: String
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
}
