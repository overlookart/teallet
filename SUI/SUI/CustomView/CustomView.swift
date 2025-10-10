//
//  CustomView.swift
//  SUI
//
//  Created by CaiGou on 2025/9/19.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        List {
            Section("ViewModifier") {
                NavigationLink("Custom View Modifier") {
                    CustomViewModifier()
                }
            }
            
            Section("Layout") {
                NavigationLink("Stack Layout") {
                    StackLayout()
                }
            }
            
            Section("Shapes") {
                NavigationLink("Rectangle") {
                    RectangleView()
                }
                NavigationLink("Circle") {
                    CircleView()
                }
                NavigationLink("Ellipse") {
                    EllipseView()
                }
                NavigationLink("Capsule") {
                    CapsuleView()
                }
            }
        }
    }
}

#Preview {
    CustomView()
}
