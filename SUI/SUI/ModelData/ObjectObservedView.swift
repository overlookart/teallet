//
//  ObjectObservedView.swift
//  SUI
//
//  Created by CaiGou on 2025/8/20.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

class ObjectModel: ObservableObject {
    @Published var name = "Some Name"
    @Published var isEnabled = false
}

struct ObjectObservedView: View {
    @StateObject private var model = ObjectModel()
    var body: some View {
        Text(model.name)
        Text("\(model.isEnabled)")
        MySubView(model: model)
    }
}

struct MySubView: View {
    @ObservedObject var model: ObjectModel
    var body: some View {
        Toggle(model.isEnabled ? "关闭" : "开启", isOn: $model.isEnabled)
    }
}

#Preview {
    ObjectObservedView()
}
