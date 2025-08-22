//
//  StoryView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct StoryView: View {
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
            Section("Environment Value") {
                
            }
        }
        .navigationTitle("Data & storage")
    }
}

#Preview {
    StoryView()
}
