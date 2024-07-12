//
//  AppDelegate.swift
//  SUI
//
//  Created by CaiGou on 2024/7/10.
//  Copyright © 2024 YYDDL. All rights reserved.
//

import Foundation
import UIKit
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        debugPrint("App -> DidFinishLaunching")
        return true
    }
}
