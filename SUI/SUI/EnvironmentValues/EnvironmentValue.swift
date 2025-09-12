//
//  Environment.swift
//  SUI
//
//  Created by CaiGou on 2025/9/12.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct EnvironmentValue: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        Text(colorScheme == .dark ? "Dark" : "Light")
    }
}

#Preview {
    EnvironmentValue()
}
