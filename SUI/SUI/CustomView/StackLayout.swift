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
                ZStack(alignment: .topLeading) {
                    Circle().frame(width: 200, height: 200)
                    Circle().frame(width: 150, height: 150).foregroundColor(.accentColor)
                    Circle().frame(width: 100, height: 100).foregroundColor(.blue)
                    Circle().frame(width: 50, height: 50).foregroundColor(.red)
                }
                .border(Color.green, width: 1)
            }
        }
        .navigationTitle("Stack Layout")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    StackLayout()
}
