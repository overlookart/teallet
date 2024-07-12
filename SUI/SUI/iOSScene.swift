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
                        Label("Home", systemImage: "app.gift.fill")
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
                    .tabItem {
                        Label("Mine", systemImage: "person")
                    }
                StoryView()
                    .tabItem {
                        Label("Other1", systemImage: "burn")
                    }
                StoryView()
                    .tabItem {
                        Label("Other2", systemImage: "info.circle.fill")
                    }
                    
            }
            .accentColor(.orange)
            .tabViewStyle(.automatic)
        }
    }
}
