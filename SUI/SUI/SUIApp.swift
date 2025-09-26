//
//  SUIApp.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI
@main
struct SUIApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    
    var body: some Scene {
        MainScene()
            .onChange(of: scenePhase, perform: sceneChange(scenePhase:))
        
        
    }
    
    ///  场景的生命周期
    private func sceneChange(scenePhase: ScenePhase) {
        switch scenePhase {
            case .active:
                debugPrint("Scene Active")
            case .background:
                debugPrint("Scene Background")
            case .inactive:
                debugPrint("Scene Inactive")
            @unknown default:
                fatalError()
        }
    }
    
    init() {
        debugPrint("App Init")
    }
    
}

