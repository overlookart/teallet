//
//  ContentView.swift
//  SUI
//
//  Created by mac on 2020/5/22.
//  Copyright © 2020 YYDDL. All rights reserved.
//

import SwiftUI

struct PropertyBindingView: View {
    @State private var isVisible: Bool = false
    var body: some View {
        VStack {
            VisibleBtn(isVisible: $isVisible)
            if isVisible {
                Text("Hello Text")
            }
        }
    }
}

struct VisibleBtn: View {
    @Binding public var isVisible: Bool
    var body: some View {
        VStack {
            Button(isVisible ? "隐藏" : "显示") {
                isVisible.toggle()
                debugPrint(isVisible)
            }
        }
    }
}

struct CustomStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundStyle(configuration.isPressed ? .orange : .cyan)
    }
}


#Preview {
    PropertyBindingView()
}
