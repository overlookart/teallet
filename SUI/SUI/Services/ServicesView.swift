//
//  ServicesView.swift
//  SUI
//
//  Created by CaiGou on 2025/11/11.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        List {
            NavigationLink("MapKit iOS 17") {
                if #available(iOS 17.0, *) {
                    MapView()
                } else {
                    
                }
            }
        }
        .navigationTitle("Services")
    }
}

#Preview {
    ServicesView()
}
