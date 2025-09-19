//
//  AppDelegate.swift
//  SUI
//
//  Created by CaiGou on 2024/7/10.
//  Copyright © 2024 YYDDL. All rights reserved.
//

import Foundation
import UIKit
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        debugPrint("AppDelegate -> DidFinishLaunching")
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        debugPrint("AppDelegate -> WillTerminate")
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        debugPrint("AppDelegate -> 连接 SceneDelegate")
        let configuration = UISceneConfiguration(name: "Default", sessionRole: connectingSceneSession.role)
        configuration.delegateClass = SceneDelegate.self
        return configuration
    }
}
