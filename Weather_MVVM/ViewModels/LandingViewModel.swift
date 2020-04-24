//
//  LandingViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 8/16/16.
//  Copyright © 2020 AroHak. All rights reserved.
//

import Foundation
import Combine

protocol LandingViewModelType {
    func viewIsReady() -> AnyPublisher<[LandingCellModelType], Never>
    func cityDidSelect(cellModel: LandingCellModelType) -> AnyPublisher<DetailViewModelType, Never>
}

struct LandingViewModel: LandingViewModelType { }

// MARK: - DidSelect -
extension LandingViewModel {
    func cityDidSelect(cellModel: LandingCellModelType) -> AnyPublisher<DetailViewModelType, Never> {
        let viewModel = DetailViewModel(coord: cellModel.coord)
        return Just(viewModel)
            .eraseToAnyPublisher()
    }
}

// MARK: - Cities -
extension LandingViewModel {    
    func viewIsReady() -> AnyPublisher<[LandingCellModelType], Never> {
        let one = city(with: "Yerevan")
        let two = city(with: "Abovyan")
        let three = city(with: "Moscow")
        let four = city(with: "London")
        
        return Publishers.CombineLatest4(one, two, three, four)
            .receive(on: RunLoop.main)
            .map { _, _, _, _ -> [LandingCellModelType] in
                let cities = DBHelper.cities.map { $0 }
                let models: [LandingCellModelType] = cities.map { LandingCellModel(city: $0) }
                return models
            }
            .tryCatch { error -> Just<[LandingCellModelType]> in
                let cities = DBHelper.cities.map { $0 }
                let models: [LandingCellModelType] = cities.map { LandingCellModel(city: $0) }
                if models.count > 0 {
                    return Just(models)
                }
                throw error
            }
            .assertNoFailure()
            .eraseToAnyPublisher()
    }
    
    func city(with name: String) -> AnyPublisher<Void, Error> {
        let request = WeatherAPI.leading(city: name)
        let response: AnyPublisher<OWLeadingDTO, Error> = Agent.run(request)
        return response
            .map { data in
                let city = LeadingObject(data: data)
                DBHelper.store(city: city)
            }
            .eraseToAnyPublisher()
    }
    
}
