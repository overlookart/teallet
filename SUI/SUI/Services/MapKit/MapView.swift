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
struct MapView: View {
    @StateObject private var locationManager = LocationManager.shared
    

    var body: some View {
        Map(coordinateRegion: $locationManager.lastRegion, showsUserLocation: true,
            annotationItems: locations) { location in
            MapPin(coordinate: location.coordinate, tint: .red)
        }
        
    
            .navigationTitle("MapKit")
            .onAppear {
                locationManager.requestLocationPermission()
            }
        
    }
    
    // 示例位置数据
    private var locations: [Location] = [
        Location(name: "天安门广场", coordinate: CLLocationCoordinate2D(latitude: 39.9042, longitude: 116.4074)),
        Location(name: "故宫", coordinate: CLLocationCoordinate2D(latitude: 39.9163, longitude: 116.3972))
    ]
}


// 位置模型
struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    MapView()
}
