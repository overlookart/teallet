//
//  RectangleView.swift
//  SUI
//
//  Created by CaiGou on 2025/9/19.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct RectangleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("矩形")
                Rectangle()
            }
            
            HStack {
                Text("圆角矩形")
                RoundedRectangle(cornerRadius: 16, style: .continuous)
            }
            
            HStack {
                if #available(iOS 16.0, *) {
                    Text("不同弧度")
                    UnevenRoundedRectangle(topLeadingRadius: 8, bottomLeadingRadius: 16, bottomTrailingRadius: 32, topTrailingRadius: 0, style: .continuous)
                }
            }
        }
        .padding(.horizontal, 16)
        
        
    }
}

#Preview {
    RectangleView()
}
