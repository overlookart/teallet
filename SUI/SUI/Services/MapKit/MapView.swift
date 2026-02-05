//
//  MapView.swift
//  SUI
//
//  Created by CaiGou on 2025/11/11.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation
@available(iOS 17.0, *)
struct MapView: View {
    @StateObject private var locationManager = LocationManager.shared
    

    var body: some View {
        Map{
            Marker("故宫", coordinate: .gugong)
            if locationManager.isPositioning {
                Marker("当前位置", coordinate: locationManager.lastLocation.coordinate)
            }
            
        }
        .navigationTitle("MapKit")
        .onAppear {
            locationManager.requestLocationPermission()
        }
    }
}


extension CLLocationCoordinate2D {
    static let gugong = CLLocationCoordinate2D(latitude: 39.9163, longitude: 116.3972)
}
