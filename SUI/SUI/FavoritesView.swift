//
//  ContentView.swift
//  SUI
//
//  Created by mac on 2020/5/22.
//  Copyright © 2020 YYDDL. All rights reserved.
//

import SwiftUI

/*
 所有视图必须遵循View协议
 该协议需要一个body计算属性，包含视图的实际布局
 
 *option + command + P 更新SwiftUI预览
 *option + command + enter 显示/隐藏预览窗口
 */

struct FavoritesView: View {
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
    @State private var title = "显示"
    @Binding public var isVisible: Bool
    var body: some View {
        Button(action: {
            isVisible.toggle()
            title = isVisible ? "隐藏" : "显示"
        }, label: {
            Text(title)
        })
    }
}

struct CustomStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundStyle(configuration.isPressed ? .orange : .cyan)
    }
}


#Preview {
    FavoritesView()
}
