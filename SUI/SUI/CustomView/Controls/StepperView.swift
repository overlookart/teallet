//
//  StepperView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/18.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct StepperView: View {
    @State private var quantity = 1
    @State private var brightness = 50.0
    @State private var temperature = 20.0
    @State private var value = 5
    var body: some View {
        Form {
            Section("基础用法") {
                Stepper(value: $quantity, in: 1...99) {
                    Text("数量: \(quantity)")
                }
            }
                    
            Section("自定义步长") {
                Stepper(value: $brightness, in: 0...100, step: 5) {
                    HStack {
                        Text("亮度")
                        Spacer()
                        Text("\(Int(brightness))%")
                    }
                }
            }
                    
            Section("自定义递增/递减逻辑") {
                Stepper {
                    Text("值: \(value)")
                } onIncrement: {
                    value = min(value * 2, 100)
                } onDecrement: {
                    value = max(value / 2, 1)
                }
            }
                    
            Section("隐藏标签") {
                Stepper("标题", value: $quantity, in: 1...99)
                    .labelsHidden()
            }
                    
            Section("自定义颜色") {
                Stepper(value: $quantity, in: 1...99) {
                    Text("自定义颜色")
                }
                .foregroundStyle(.cyan)
            }
            
            Section("格式化数值") {
                if #available(iOS 16.0, *) {
                    Stepper(value: $temperature, in: 10...35, step: 0.5, format: .number.precision(.fractionLength(1))) {
                        Text("温度: \(temperature, specifier: "%.1f")°C")
                    }
                }
            }
            
        }
        .navigationTitle("Stepper")
    }
}

#Preview {
    StepperView()
}
