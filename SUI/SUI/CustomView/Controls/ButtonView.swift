//
//  ControlsView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/17.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @State private var showAlert: Bool = false
    var body: some View {
        VStack{
            HStack {
                Button("按钮1") {
                    btnAction()
                }
                Divider()
                Button(action: btnAction) {
                    Text("按钮2")
                }
                Divider()
                Button("按钮3", systemImage: "timelapse") {
                    btnAction()
                }
            }
            HStack {
                Button(role: .destructive, action: btnAction) {
                    Text("按钮4")
                    Image(systemName: "plus")
                }
                Divider()
                Button("按钮5", role: .cancel, action: btnAction)
                    .buttonStyle(.plain)
                    
                    
                Divider()
                Button("     ", systemImage: "", role: .destructive, action: btnAction)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.roundedRectangle)
            }
            
            HStack {
                Button("按钮7") {
                    btnAction()
                }
                Divider()
                Button("按钮8", systemImage: "exclamationmark.circle") {
                    btnAction()
                }
                
            }.buttonStyle(.borderedProminent)
        }
        .navigationTitle("Button")
        .navigationBarTitleDisplayMode(.inline)
        .alert("弹窗", isPresented: $showAlert) {
            
        }
    }
    
    func btnAction() {
        showAlert.toggle()
    }
}

#Preview {
    ButtonView()
}
