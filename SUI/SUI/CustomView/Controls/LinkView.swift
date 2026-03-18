//
//  LinkView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/17.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct LinkView: View {
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
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
                        alertMessage = url.absoluteString
                        showAlert = true
                        return .handled
                    })
                    .alert("弹窗", isPresented: $showAlert) {
                        Button("ok"){
                            showAlert = false
                        }
                    } message: {
                        Text(alertMessage)
                    }

            }
            
        }
        .navigationTitle("Link")
    }
}

#Preview {
    LinkView()
}
