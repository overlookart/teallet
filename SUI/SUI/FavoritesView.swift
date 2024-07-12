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

let formatterStr = "long textbstring"
let colors: [Color] = [.red, .green, .blue]
let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
struct Result {
    var id = UUID()
    var score: Int
}

struct FavoritesView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    var body: some View {
        NavigationView {
            ListView()
                .navigationTitle("列表")
        }
    
    }
}

#Preview {
    FavoritesView()
}
