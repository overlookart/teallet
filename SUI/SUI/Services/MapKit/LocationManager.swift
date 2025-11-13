//
//  LocationManager.swift
//  SUI
//
//  Created by CaiGou on 2025/11/13.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager()
    private let manager = CLLocationManager()
    
    /// 位置权限状态
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    
    @Published var lastLocation = CLLocation()
    
    @Published var lastRegion = MKCoordinateRegion()
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    /// 请求位置权限
    public func requestLocationPermission(){
        manager.requestWhenInUseAuthorization()
    }
    
    func startLocationUpdates() {
        manager.startUpdatingLocation()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    /// 位置权限改变
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatus = status
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            debugPrint("请求位置权限成功")
            self.startLocationUpdates()
        case .denied, .restricted:
            debugPrint("请求位置权限失败")
        case .notDetermined:
            break
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        debugPrint("获取位置成功")
        lastLocation = location
        lastRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        debugPrint("LocationManager:---->\(error.localizedDescription)")
    }
    
    
}
