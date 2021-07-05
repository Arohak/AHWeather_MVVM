//
//  MapView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 13.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import SwiftUI

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    
    private let name: String

    init(with name: String) {
        self.name = name
        self.viewModel = .init(city: name)
    }
    
    var loading: some View {
        Text("Loading \(name)'s weather...")
            .foregroundColor(.gray)
    }
    
    var body: some View {
        List(content: content)
            .onAppear(perform: viewModel.fetch)
            .navigationBarTitle(name)
            .listStyle(GroupedListStyle())
    }
    
    func content() -> some View {
        if let value = viewModel.value {
            return AnyView(MapRowView(viewModel: .init(item: value)))
        } else {
            return AnyView(loading)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(with: "Yerevan")
    }
}
