//
//  iOSScene.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct iOSScene: Scene {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("tab1", systemImage: "book")
                    }
            }
        }
    }
}
