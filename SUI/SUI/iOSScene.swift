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
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "person")
                    }
                StoryView()
                    .tabItem {
                        Label("Story", systemImage: "book")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "star")
                    }
                FunFactsView()
                    .tabItem { Label("Fun Facts", systemImage: "hand.thumbsup") }
            }
        }
    }
}
