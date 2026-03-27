//
//  ColorPickerView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/27.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColor = Color.blue
    @State private var savedColors: [Color] = []
    @State private var showOpacity = true
    var body: some View {
        VStack(spacing: 20) {
            // 颜色预览
            RoundedRectangle(cornerRadius: 12)
                .fill(selectedColor)
                .frame(height: 150)
                .shadow(radius: 5)
                .padding()
                    
            // 颜色选择器
            ColorPicker("选择颜色", selection: $selectedColor, supportsOpacity: showOpacity)
                .padding()
            
                    
            // 不透明度控制
            Toggle("支持透明度", isOn: $showOpacity)
                .padding(.horizontal)
                    
            // 已保存的颜色
            if !savedColors.isEmpty {
                VStack(alignment: .leading) {
                    Text("已保存的颜色")
                        .font(.headline)
                            
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(savedColors, id: \.self) { color in
                                Circle()
                                    .fill(color)
                                    .frame(width: 40, height: 40)
                                    .onTapGesture {
                                        selectedColor = color
                                    }
                            }
                        }
                    }
                }
                .padding()
            }
                    
            // 保存按钮
            Button("保存当前颜色") {
                savedColors.append(selectedColor)
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .navigationTitle("调色板")
    }
}

#Preview {
    ColorPickerView()
}
