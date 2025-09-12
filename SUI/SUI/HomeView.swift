//
//  HomeView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ListView()
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "plus")
                }
                
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
            
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
        }
    }
    
    init(){
        debugPrint("HomeView init")
    }
    
    private func tapGestureAction(){
        debugPrint("点击事件")
    }
    
    private func plusAction(){
        
    }
}

#Preview {
    HomeView()
}
