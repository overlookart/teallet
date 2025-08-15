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
                if #available(iOS 16.0, *){
                    NavigationStack {
                        HomeView()
                            .navigationTitle("首页")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar(.visible, for: .navigationBar)
                    }
                    .tabItem {
                        Label("Home", systemImage: "heart")
                    }
                }else{
                    NavigationView {
                        HomeView()
                            .navigationTitle("首页")
                            .navigationBarTitleDisplayMode(.large)
                            .navigationBarHidden(false)
                            .navigationViewStyle(.stack)
                    }
                    .tabItem {
                        Label("Home", systemImage: "heart")
                    }
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
    init() {
        debugPrint("iOS Scene Init")
    }
}
