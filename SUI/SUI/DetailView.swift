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
                Button("按钮1") {
                    btnAction()
                }
                Text("|")
                Button(action: btnAction) {
                    Text("按钮2")
                }
                Text("|")
                Button("按钮3", systemImage: "timelapse") {
                    btnAction()
                }
            }
            HStack {
                Button(role: .destructive, action: btnAction) {
                    Text("按钮4")
                    Image(systemName: "plus")
                }
                
                Button("按钮5", role: .cancel, action: btnAction)
                Text("|")
                Button("", systemImage: "", role: .destructive, action: btnAction)
            }
            
            HStack {
                Button("按钮7") {
                    btnAction()
                }
                Button("按钮8", systemImage: "exclamationmark.circle") {
                    btnAction()
                }
                
            }.buttonStyle(.borderedProminent)
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
