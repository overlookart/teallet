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
                if #available(iOS 16.0, *) {
                    NavigationLink("Grid Layout") {
                        GridView()
                    }
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
            Section("Controls") {
                NavigationLink("Button") {
                    ButtonView()
                }
                NavigationLink("Link") {
                    LinkView()
                }
                NavigationLink("Slider") {
                    SliderView()
                }
                NavigationLink("Stepper") {
                    StepperView()
                }
            }
        }
        .navigationTitle("View")
    }
}

#Preview {
    CustomView()
}
