//
//  StoryView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct DataView: View {
    var body: some View {
        List {
            Section("Model Data") {
                NavigationLink{
                    PropertyBindingView()
                } label: {
                    Text("Property Binding")
                }
                NavigationLink {
                    ObjectObservedView()
                } label: {
                    Text("Object Observed")
                }
            }
            Section("Environment Values") {
                NavigationLink {
                    EnvironmentValue()
                } label: {
                    Text("Environment values")
                }
                
                NavigationLink {
                    CustomEnvironmentValue()
                } label: {
                    Text("Custom Environment value")
                }

            }
        }
        .navigationTitle("Data & storage")
    }
}

#Preview {
    DataView()
}
