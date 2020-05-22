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
 */
struct ContentView: View {
    var body: some View {
        
        /**
         在SwiftUI中，此导航控件是NavigationView，
         它结合了UINavigationBar的显示样式和UINavigationController的视图控制器堆栈行为。 要加入其中，只需在列表周围添加NavigationView，
         */
        NavigationView{
            List{
                Text("Item1")
                Text("Item2")
                Text("Item3")
            }
            .navigationBarTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
