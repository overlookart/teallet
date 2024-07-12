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
        ZStack {
            
            VStack {
                Spacer()
                Circle()
                    .foregroundColor(.purple)
                Spacer()
            }
        }
        .background(Color.pink)
            
    }
    
    init(){
        debugPrint("HomeView init")
        
    }
}

#Preview {
    HomeView()
}
