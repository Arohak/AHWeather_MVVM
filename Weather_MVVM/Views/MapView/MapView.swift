//
//  MapView.swift
//  Weather_MVVM
//
//  Created by Ara Hakobyan on 13.03.21.
//  Copyright © 2020 AroHak. All rights reserved.
//

import SwiftUI
import MapKit

@available(iOS 14.0, *)
struct MapView: View {

    @State private var cities: [City] = [
        City(coordinate: .init(latitude: 40.7128, longitude: 74.0060)),
        City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
    ]

    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.7617, longitude: 80.1918),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: cities) { city in
            MapAnnotation(
                coordinate: city.coordinate,
                anchorPoint: CGPoint(x: 0.5, y: 0.5)
            ) {
                Circle()
                    .stroke(Color.green)
                    .frame(width: 44, height: 44)
            }
        }
    }
}

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

@available(iOS 14.0, *)
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}