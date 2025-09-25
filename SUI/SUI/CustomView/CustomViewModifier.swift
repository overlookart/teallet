//
//  CustomViewModifier.swift
//  SUI
//
//  Created by CaiGou on 2025/9/24.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct CustomViewModifier: View {
    var body: some View {
        Text("Custom View Modifier")
            .customStyle()
    }
}

struct CustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 8)
            .border(.cyan, width: 1)
            .foregroundStyle(.purple)
    }
}

extension Text {
    func customStyle() -> some View {
        modifier(CustomModifier())
    }
}


#Preview {
    CustomViewModifier()
}
