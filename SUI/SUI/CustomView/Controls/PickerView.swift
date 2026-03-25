//
//  PickerView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/24.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case light = "浅色"
    case dark = "深色"
    case system = "系统默认"
    
    var id: String { rawValue }
}

struct Border {
    var color: Color
    var thickness: Theme
}

struct PickerView: View {
    
    @State private var selectedTheme = Theme.system
    
    @State private var selectedObjectBorders = [
        Border(color: .black, thickness: .dark),
        Border(color: .red, thickness: .light)
    ]
    
    var body: some View {
        Form {
            Section(header: Text("外观")) {
                Picker("主题", selection: $selectedTheme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.segmented)
                Picker("主题", selection: $selectedTheme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.inline)
                Picker("主题", selection: $selectedTheme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.menu)
                Picker("主题", selection: $selectedTheme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }
                .pickerStyle(.wheel)
            }
            Section("样式") {
                Picker("外观", systemImage: "photo.circle", selection: $selectedTheme) {
                    ForEach(Theme.allCases) { theme in
                        Text(theme.rawValue.capitalized).tag(theme)
                    }
                }
                .pickerStyle(.automatic)
                .foregroundStyle(.cyan)
            }
        }
        .navigationTitle("Picker")
    }
}

#Preview {
    PickerView()
}
