//
//  SettingView.swift
//  SUI
//
//  Created by CaiGou on 2025/9/12.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var isDark: Bool = false
    @State private var isFollowSystem: Bool = true
    var body: some View {
        
        List {
            Section {
                Toggle("跟随系统", isOn: $isFollowSystem)
                Toggle(isDark ? "Dark" : "Light", isOn: $isDark)
                    .disabled(isFollowSystem)
            } header: {
                Text("主题设置")
            }
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .navigationTitle("设置")
        .navigationBarTitleDisplayMode(.large)
    }
    
    init() {
        self.isDark = colorScheme == .dark
    }
}

#Preview {
    SettingView()
}
