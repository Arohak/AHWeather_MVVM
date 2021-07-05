//
//  MapViewModel.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 24.03.21.
//  Copyright © 2021 EGS. All rights reserved.
//

import SwiftUI
import Combine

class MapViewModel: ObservableObject {
    @Published var value: OWLeadingDTO!
    
    private var city: String = ""

    private var disposables = Set<AnyCancellable>()
    
    init(city: String) {
        self.city = city
    }
    
    func fetch() {
        WeatherEndpoint.leading(city: city).execute(type: OWLeadingDTO.self)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    switch value {
                    case .failure:  self?.value = nil
                    case .finished: break
                    }
                },
                receiveValue: { [weak self] response in
                    self?.value = response.value
                })
            .store(in: &disposables)
    }
}
