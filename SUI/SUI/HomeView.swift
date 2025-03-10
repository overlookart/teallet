//
//  HomeView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/26.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct DataModel: Identifiable {
    var id: UUID = UUID()
    var title: String = ""
    var subtitle: String = ""
}

struct SectionDataModel: Identifiable {
    var id: UUID = UUID()
    var sectionName: String = ""
    var items: [DataModel] = []
}

struct HomeView: View {
    var datas: [SectionDataModel] = [
        SectionDataModel(sectionName: "分组1", items: [
            DataModel(title: "My Title", subtitle: "subtitle"),
            DataModel(title: "标题", subtitle: "子标题")
        ]),
        SectionDataModel(sectionName: "小池--杨万里", items: [
            DataModel(title: "泉眼无声惜细流", subtitle: "树阴照水爱晴柔"),
            DataModel(title: "小荷才露尖尖角", subtitle: "早有蜻蜓立上头")
        ])
    ]
    
    
    var body: some View {
        List {
            ForEach(datas) { section in
                Section(header: Text(section.sectionName)) {
                    ForEach(section.items) { item in
                        NavigationLink(destination: DetailView()) {
                            HomeRowView(model: item)
                        }
                    }
                }
            }
        }
    }
    
    init(){
        debugPrint("HomeView init")
    }
}

struct HomeRowView: View {
    var model: DataModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(model.title)
                .font(.headline)
            Label(model.subtitle, systemImage: "exclamationmark.circle")
                .font(.subheadline)
        }
    }
}

#Preview {
    HomeView()
}
