//
//  GridView.swift
//  SUI
//
//  Created by CaiGou on 2025/10/29.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

@available(iOS 16.0, *)
struct GridView: View {
    var body: some View {
        ScrollView {
            Grid(alignment: .bottom, horizontalSpacing: 1, verticalSpacing: 1) {
                GridRow {
                    ForEach(0..<2) { _ in Color.red }
                }
                .frame(height: 100)
                GridRow {
                    ForEach(0..<5) { _ in Color.green }
                }
                .frame(height: 200)
                GridRow {
                    ForEach(0..<4) { _ in Color.blue }
                }
                .frame(height: 300)
                GridRow {
                    Color.orange
                        .gridCellColumns(2)
                        .frame(height: 300)
                }
            }
        }
        
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        GridView()
    }
}
