//
//  ForecastViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import SwiftUI
import Combine

class ForecastViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var rows: [ForecastRow] = []
    
    private var disposables = Set<AnyCancellable>()
    
    init(scheduler: DispatchQueue = DispatchQueue(label: "ForecastViewModel")) {
        $city
            .dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetch(forCity:))
            .store(in: &disposables)
    }
    
//    func fetch(forCity name: String) {
//        Fetcher<ForecastDTO>.run(WeatherAPI.forecast(city: name))
//            .map { response in
//                response.list.map(ForecastRow.init)
//            }
//            .map(Array.removeDuplicates)
//            .receive(on: DispatchQueue.main)
//            .sink(
//                receiveCompletion: { [weak self] value in
//                    switch value {
//                    case .failure:  self?.rows = []
//                    case .finished: break
//                    }
//                },
//                receiveValue: { [weak self] rows in
//                    self?.rows = rows
//                })
//            .store(in: &disposables)
//    }
    
    func fetch(forCity name: String) {
        WeatherEndpoint.forecast(city: name).execute(type: ForecastDTO.self)
            .map { response in
                response.value.list.map(ForecastRow.init)
            }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure:  self?.rows = []
                    case .finished: break
                    }
                },
                receiveValue: { [weak self] rows in
                    self?.rows = rows
                })
            .store(in: &disposables)
    }
}
