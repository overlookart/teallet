//
//  ListView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/27.
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

struct ListView: View {
    var datas: [SectionDataModel] = [
        SectionDataModel(sectionName: "法律法规", items: [
            DataModel(title: "行政处罚法", subtitle: "行政机关依法对违反行政管理秩序"),
            DataModel(title: "化妆品管理条例", subtitle: "规范化妆品生产经营活动"),
            DataModel(title: "西班牙政府采购制度", subtitle: "西班牙政府采购制度")
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
                            ListRowView(model: item)
                        }
                        .listRowBackground(Color.purple.opacity(0.1))
                        .listRowInsets(.init(top: 8, leading: 8, bottom: 8, trailing: 8))
                        .listItemTint(.green)
                        .listRowSeparatorTint(.yellow, edges: .all)
                        .listRowSeparator(.visible, edges: .all)
                        .swipeActions(edge: .leading, allowsFullSwipe: true) {
                            Button {
                                debugPrint("Read Action")
                            } label: {
                                Label("Read", systemImage: "envelope.open")
                            }
                            .tint(.blue)
                            Button {
                                debugPrint("Unread Action")
                            } label: {
                                Label("Unread", systemImage: "envelope.badge")
                            }
                        }
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button {
                                debugPrint("Delete Action")
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                            Button {
                                debugPrint("Flag Action")
                            } label: {
                                Label("Flag", systemImage: "flag")
                            }
                            .tint(.orange)
                        }
                        //.badge("❤️")//设置徽章
                        
                    }
                }
                .listSectionSeparatorTint(.cyan, edges: .all)
                .listSectionSeparator(.hidden, edges: .top)
                .headerProminence(.increased)
            }
        }
        .listStyle(.insetGrouped)
        .listRowSpacing(0)
    }
}

struct ListRowView: View {
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
    ListView()
}
