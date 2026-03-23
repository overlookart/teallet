//
//  ToggleView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/23.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
    @State private var isEnabled = false
    @State private var notifications = true
    @State private var sound = false
    var body: some View {
        Form {
            Section("基础用法") {
                Toggle("启用功能", isOn: $isEnabled)
                Text(isEnabled ? "功能已启用" : "功能已禁用")
                    .foregroundColor(isEnabled ? .green : .secondary)
            }
                    
            Section("自定义标签") {
                Toggle(isOn: $notifications) {
                    HStack {
                        Image(systemName: "bell.fill")
                        Text("推送通知")
                    }
                }
            }
                    
            Section("Switch 样式") {
                Toggle("声音", isOn: $sound)
                    .toggleStyle(.switch)
                Toggle("锁定", systemImage: sound ? "lock.open" : "lock", isOn: $sound)
                    .toggleStyle(.switch)
                
            }
                    
            Section("Button 样式") {
                HStack {
                    Toggle("视频", isOn: $notifications)
                    Toggle("锁定", systemImage: sound ? "lock.open" : "lock", isOn: $sound)
                        .toggleStyle(.button)
                }
                .toggleStyle(.button)
                .tint(.indigo)
                .foregroundStyle(.orange)
            }
                    
            Section("自定义颜色") {
                Toggle("自定义颜色", isOn: $isEnabled)
                    .tint(.orange)
            }
                    
            Section("隐藏标签") {
                Toggle("", isOn: $isEnabled)
                    .labelsHidden()
                    .accessibilityLabel("启用功能")
            }
                    
            Section("绑定到派生状态") {
                Toggle("用户偏好", isOn: Binding(
                    get: { UserDefaults.standard.bool(forKey: "user_preference") },
                    set: { UserDefaults.standard.set($0, forKey: "user_preference") }
                ))
            }
        }
        .navigationTitle("Toggle")
    }
}

#Preview {
    ToggleView()
}
