//
//  DatePickerView.swift
//  SUI
//
//  Created by CaiGou on 2026/3/27.
//  Copyright © 2026 YYDDL. All rights reserved.
//

import SwiftUI

struct DatePickerView: View {
    @State private var bookingDate = Date.now
        
    // 只允许选择从今天开始的未来30天
    let availableRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let today = Date.now
        let endDate = calendar.date(byAdding: .day, value: 30, to: today)!
        return today...endDate
    }()
    var body: some View {
        Form {
            Section(header: Text("预约信息")) {
                DatePicker("预约日期", selection: $bookingDate, in: availableRange, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.graphical)
            }
            Section {
                DatePicker("预约日期", selection: $bookingDate, in: availableRange, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.compact)
            }
            Section {
                Text("已选择: \(bookingDate.formatted(date: .long, time: .shortened))")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    DatePickerView()
}
