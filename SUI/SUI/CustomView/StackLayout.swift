//
//  StackLayout.swift
//  SUI
//
//  Created by CaiGou on 2025/10/9.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct StackLayout: View {
    var body: some View {
        List {
            Section("HStack") {
                HStack(alignment: .center, spacing: 16) {
                    Circle()
                    Rectangle()
                    Capsule()
                }
            }
            
            Section("VStack") {
                VStack(alignment: .center, spacing: 16) {
                    Ellipse().frame(height: 100)
                    Rectangle().frame(height: 100)
                    Ellipse().frame(height: 100)
                }
            }
            
            Section("ZStack") {
                ZStack(alignment: .center) {
                    Circle().frame(height: 200)
                    Circle().frame(height: 150).foregroundColor(.accentColor)
                    Circle().frame(height: 100).foregroundColor(.blue)
                    Circle().frame(height: 50).foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Stack Layout")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    StackLayout()
}
