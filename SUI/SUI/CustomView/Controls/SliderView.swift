//
//  SliderView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/18.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    var body: some View {
        List {
            Section("基础用法") {
                Slider(value: $speed, in: 0...100)
                Text("当前值: \(Int(speed))")
            }
                    
            Section("步进Slider") {
                Slider(value: $speed, in: 0...100, step: 10){
                    Text("iOS 26+ 自动显示刻度")
                }
            }
                    
            Section("带标签") {
                Slider(value: $speed, in: 0...100) {
                    Text("调整速度")
                } minimumValueLabel: {
                    Text("0")
                        .font(.caption)
                } maximumValueLabel: {
                    Text("100")
                        .font(.caption)
                }
            }
                    
            Section("自定义样式") {
                Slider(value: $speed, in: 0...100, step: 5) {
                    Text("自定义颜色")
                } minimumValueLabel: {
                    Image(systemName: "tortoise")
                } maximumValueLabel: {
                    Image(systemName: "hare")
                }
                .tint(.cyan)
                .foregroundStyle(.red)
            }
                    
            Section("编辑状态监听") {
                Slider(value: $speed, in: 0...100) {
                    Text("监听编辑状态")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                .tint(isEditing ? .red : .primary)
            }
            
            Section("禁用编辑") {
                Slider(value: $speed, in: 0...100)
                    .disabled(true)
            }
            
            Section("iOS 26 新特性") {
                if #available(iOS 26.0, *) {
                    Slider(value: $speed, in: 0...100) {
                        Text("调整速度")
                    } ticks: {
                        SliderTickContentForEach(
                            stride(from: 0.0, through: 100, by: 25).map { $0 },
                            id: \.self
                        ) { value in
                            SliderTick(value) {
                                Text("\(Int(value * 100))%")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Slider")
    }
}

#Preview {
    SliderView()
}
