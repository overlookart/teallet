//
//  iOSScene.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct MainScene: Scene {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 18.0, *) {
                MainTabView()
                    .tabViewStyle(.sidebarAdaptable)
            }else {
                MainTabView()
            }
        }
    }
}
