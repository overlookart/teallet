//
//  ListView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/27.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var data: [String] = ["a","b","c"]
    var body: some View {
        List {
            ForEach(data.indices){ i in
                Text("\(i)")
            }
        }
    }
}

#Preview {
    ListView()
}
