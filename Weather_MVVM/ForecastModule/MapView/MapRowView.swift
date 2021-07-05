//
//  MapRowView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 24.03.21.
//  Copyright © 2021 EGS. All rights reserved.
//

import SwiftUI
import MapKit

struct MapRowView: View {
    private let viewModel: MapRowViewModel
    
    init(viewModel: MapRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: viewModel.coordinate)
                .cornerRadius(25)
                .frame(height: 300)
                .disabled(true)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("☀️ Temperature:")
                    Text("\(viewModel.temperature)°")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("📈 Max temperature:")
                    Text("\(viewModel.maxTemperature)°")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("📉 Min temperature:")
                    Text("\(viewModel.minTemperature)°")
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("💧 Humidity:")
                    Text(viewModel.humidity)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

private extension MapRowView {
    struct MapView: UIViewRepresentable {
        private let coordinate: CLLocationCoordinate2D
      
        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
        }
        
        func makeUIView(context: Context) -> MKMapView {
            MKMapView()
        }

        func updateUIView(_ view: MKMapView, context: Context) {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            view.addAnnotation(annotation)
            view.setRegion(region, animated: true)
        }
    }
}
