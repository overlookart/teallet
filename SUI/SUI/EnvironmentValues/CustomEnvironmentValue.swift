//
//  CustomEnvironmentValue.swift
//  SUI
//
//  Created by CaiGou on 2025/9/16.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct CustomEnvironmentValue: View {
    
    @Environment(\.customValue) var customValue: String
    
    var body: some View {
        Text(customValue)
            .navigationTitle("Custom Environment value")
    }
}

extension EnvironmentValues {
    @Entry var customValue: String = "Default"
}

#Preview {
    CustomEnvironmentValue()
}
