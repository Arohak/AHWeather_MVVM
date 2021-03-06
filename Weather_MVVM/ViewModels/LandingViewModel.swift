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
    func viewIsReady_() -> AnyPublisher<[LandingCellModelType], Never> {
        let one = city(with: "Yerevan")
        let two = city(with: "London")
        let three = city(with: "Moscow")
        
        return Publishers.CombineLatest3(one, two, three)
            .receive(on: RunLoop.main)
            .map { _, _, _ -> [LandingCellModelType] in
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
    
    func city(with name: String) -> AnyPublisher<LeadingObject, Error> {
        let request = WeatherAPI.leading(city: name)
        let response: AnyPublisher<OWLeadingDTO, Error> = Agent.run(request)
        return response
            .map { data -> LeadingObject in
                let city = LeadingObject(data: data)
                DBHelper.store(city: city)
                return city
            }
            .eraseToAnyPublisher()
    }
}

extension LandingViewModel {
        func viewIsReady() -> AnyPublisher<[LandingCellModelType], Never> {
            let names: [String] = ["Yerevan", "London", "Moscow"]
            return mergedCities(with: names)
                .map { _ -> [LandingCellModelType] in
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
        
        func mergedCities(with names: [String]) -> AnyPublisher<LeadingObject, Error> {
            precondition(!names.isEmpty)

            let initialPublisher = city(with: names[0])
            let remainder = Array(names.dropFirst())
            
            return remainder.reduce(initialPublisher) { combined, name in
                return combined
                    .merge(with: city(with: name))
                    .eraseToAnyPublisher()
            }
        }
}
