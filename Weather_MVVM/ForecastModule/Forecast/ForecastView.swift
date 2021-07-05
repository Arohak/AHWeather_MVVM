//
//  ForecastView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 06.03.21.
//  Copyright © 2021 AroHak. All rights reserved.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var viewModel: ForecastViewModel
    
    init(viewModel: ForecastViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                
                if viewModel.rows.isEmpty {
                    emptySection
                } else {
                    cityHourlyWeatherSection
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather ⛅️")
        }
    }
}

private extension ForecastView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Cupertino", text: $viewModel.city)
        }
    }
    
    var forecastSection: some View {
        Section {
            ForEach(viewModel.rows, content: DailyWeatherRow.init(viewModel:))
        }
    }
    
    var cityHourlyWeatherSection: some View {
        Section {
            if #available(iOS 14.0, *) {
                NavigationLink(destination: MapView(with: viewModel.city)) {
                    VStack(alignment: .leading) {
                        Text(viewModel.city)
                        Text("Weather today")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init())
    }
}
