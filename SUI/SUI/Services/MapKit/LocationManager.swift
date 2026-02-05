//
//  LocationManager.swift
//  SUI
//
//  Created by CaiGou on 2025/11/13.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import Foundation
import CoreLocation
class LocationManager: NSObject, ObservableObject {
    static let shared = LocationManager()
    private let manager = CLLocationManager()
    
    /// 位置权限状态
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    @Published var lastLocation = CLLocation()
    
    @Published var isPositioning: Bool = false
    
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
            debugPrint("位置权限未确定")
        @unknown default:
            debugPrint("未知的位置权限状态")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        debugPrint("获取位置成功: \(location)")
        lastLocation = location
        isPositioning = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        debugPrint("LocationManager:---->\(error.localizedDescription)")
    }
}
