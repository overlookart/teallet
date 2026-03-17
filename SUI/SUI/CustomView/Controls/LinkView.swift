//
//  LinkView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/17.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        List {
            // 基础链接
            Section("基础用法") {
                Link("Apple 官网", destination: URL(string: "https://www.apple.com")!)
            }
                    
            // 自定义标签
            Section("自定义标签") {
                Link(destination: URL(string: "https://developer.apple.com")!) {
                    Label("Apple 开发者", systemImage: "a.circle")
                }
            }
                    
            // 自定义 URL 处理
            Section("自定义处理") {
                Link("带日志的链接", destination: URL(string: "https://example.com")!)
                    .environment(\.openURL, OpenURLAction { url in
                        print("打开: \(url)")
                        return .handled
                    })
            }
                    
            // 样式化链接
            Section("样式化") {
                Link("超链接样式", destination: URL(string: "https://www.swift.org")!)
//                    .buttonStyle(.link)
                }
        }
        .navigationTitle("Link")
    }
}

#Preview {
    LinkView()
}
