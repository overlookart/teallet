//
//  DetailView.swift
//  SUI
//
//  Created by CaiGou on 2025/3/10.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @State private var showAlert: Bool = false
    var body: some View {
        HStack {
            Button("按钮1") {
                btnAction()
            }
            
            Button(action: btnAction) {
                Text("按钮2")
            }
        }
        .navigationTitle("详情")
        .navigationBarTitleDisplayMode(.inline)
        .alert("弹窗", isPresented: $showAlert) {
            
        }
    }
    private func btnAction(){
        showAlert.toggle()
    }
}

#Preview {
    DetailView()
}
