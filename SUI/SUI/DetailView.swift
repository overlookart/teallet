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
        VStack{
            HStack {
                Spacer()
                Button("按钮1") {
                    btnAction()
                }
                Spacer()
                Button(action: btnAction) {
                    Text("按钮2")
                }
                Spacer()
                Button("按钮3", systemImage: "timelapse") {
                    btnAction()
                }
                Spacer()
            }
            HStack {
                Button(role: .destructive, action: btnAction) {
                    Text("按钮4")
                }
                Button("按钮5", role: .cancel, action: btnAction)
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
