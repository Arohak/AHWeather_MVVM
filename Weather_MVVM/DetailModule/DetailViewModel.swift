//
//  DetailViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

protocol DetailViewModelType {
    var coord: CLLocationCoordinate2D { get }
    func viewIsReady() -> AnyPublisher<DetailModelType, Never>
}

struct DetailViewModel: DetailViewModelType {
    var coord: CLLocationCoordinate2D
    
    init(coord: CLLocationCoordinate2D) {
        self.coord = coord
    }
}

extension DetailViewModel {
    func viewIsReady() -> AnyPublisher<DetailModelType, Never> {
        let request = WeatherAPI.detail(coord: coord)
        let response: AnyPublisher<OWDetailDTO, Error> = Agent.run(request)
        return response
            .receive(on: RunLoop.main)
            .map { data -> DetailModelType in
                let forecast = DetailObject(data: data)
                DBHelper.storeCity(forecast: forecast)
                let object = DBHelper.getForecast(for: self.coord).map { $0 }.first!
                let viewModel = self.createDetailModel(forecast: object)
                return viewModel
            }
            .tryCatch { error -> Just<DetailModelType> in
                if let forecast = DBHelper.getForecast(for: self.coord).map({ $0 }).first {
                    return Just(self.createDetailModel(forecast: forecast))
                }
                throw error
            }
            .assertNoFailure()
            .eraseToAnyPublisher()
    }
    
    private func createDetailModel(forecast: DetailObject) -> DetailModelType {
        let topView = DetailTopViewModel(data: forecast)
        var dayCells: [DetailDayCellModelType] = []
        for i in 1..<forecast.daily.count {
            let item = DetailDayCellModel(day: forecast.daily[i], hours: forecast.hourly)
            dayCells.append(item)
        }
        let viewModel = DetailModel(topView: topView, dayCells: dayCells)
        return viewModel
    }
}
