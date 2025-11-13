//
//  iOSWindowContent.swift
//  SUI
//
//  Created by CaiGou on 2025/9/26.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
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
            
            NavigationView {
                DataView()
            }
            .tabItem {
                Label("Data", systemImage: "d.circle.fill")
            }
            
            NavigationView {
                CustomView()
            }
            .tabItem {
                Label("View", systemImage: "square.stack.3d.down.forward.fill")
            }
            
            NavigationView {
                ServicesView()
            }
            .tabItem {
                Label("Services", systemImage: "icloud")
            }
            
            FunFactsView()
                .tabItem {
                    Label("Mine", systemImage: "person")
                }
        }
        .accentColor(.orange)
    }
}

#Preview {
    MainTabView()
}
