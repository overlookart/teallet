//
//  SceneDelegate.swift
//  SUI
//
//  Created by CaiGou on 2024/7/10.
//  Copyright © 2024 YYDDL. All rights reserved.
//

import Foundation
import UIKit
class SceneDelegate: NSObject, UIWindowSceneDelegate {

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        debugPrint("SceneDelegate -> willConnectTo")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // For macCatalyst
        #if targetEnvironment(macCatalyst)
        // Hide title bar on macOS
        if let titleBar = windowScene.titlebar {
            titleBar.titleVisibility = .hidden
        }
        #endif
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        debugPrint("SceneDelegate -> DidDisconnect")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        debugPrint("SceneDelegate -> WillEnterForeground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        debugPrint("SceneDelegate -> DidEnterBackground")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        debugPrint("SceneDelegate -> DidBecomeActive")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        debugPrint("SceneDelegate -> WillResignActive")
    }
}
