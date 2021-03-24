//
//  DailyWeatherRow.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 13.03.21.
//  Copyright © 2021 AroHak. All rights reserved.
//

import SwiftUI

struct DailyWeatherRow: View {
  private let viewModel: ForecastRow
  
  init(viewModel: ForecastRow) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack {
      VStack {
        Text("\(viewModel.day)")
        Text("\(viewModel.month)")
      }
      
      VStack(alignment: .leading) {
        Text("\(viewModel.title)")
          .font(.body)
        Text("\(viewModel.fullDescription)")
          .font(.footnote)
      }
        .padding(.leading, 8)

      Spacer()

      Text("\(viewModel.temperature)°")
        .font(.title)
    }
  }
}

struct DailyWeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherRow(viewModel: .init(item: .init(dt: Date(), main: .init(temp: 0.4), weather: [.init(main: .clear, weatherDescription: "dd")])))
    }
}
