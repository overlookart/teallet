//
//  SwiftUIView.swift
//  SUI
//
//  Created by mac on 2020/6/1.
//  Copyright © 2020 YYDDL. All rights reserved.
//

import SwiftUI

struct AdaptiveStack<Content: View>: View {
    @Environment(\.verticalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct SwiftUIView: View {
//    var body: some View {
//        Group {
//            if Bool.random() {
//                Image("example-image")
//            } else {
//                Text("Better luck next time")
//            }
//        }
//    }
    
//    var body: some View {
//        if Bool.random() {
//            return AnyView(Image("example-image"))
//        } else {
//            return AnyView(Text("Better luck next time"))
//        }
//    }
//    var body: some View {
//        AdaptiveStack {
//            Text("Horizontal when there's lots of space")
//            Text("but")
//            Text("Vertical when space is restricted")
//        }
//    }
    
//    var body: some View {
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                Text("Left")
//                    .frame(width: geometry.size.width / 2, height: 50)
//                    .background(Color.yellow)
//                Text("Right")
//                    .frame(width: geometry.size.width / 2, height: 50)
//                    .background(Color.orange)
//            }
//        }
//    }
    
//    var body: some View{
//        ScrollView(.horizontal) {
//            HStack(spacing: 20) {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.red)
//                }
//            }
//        }
//    }
    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<10) { num in
//                    VStack {
//                        GeometryReader { geo in
//                            Text("Number \(num)")
//                                .font(.largeTitle)
//                            .padding()
//                            .background(Color.red)
//                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
//                        }
//                    }
//                    .frame(width: 180)
//                }
//            }
//            .padding()
//        }
//    }
    
    
//    @State var dragAmount = CGSize.zero
//    var body: some View {
//        VStack {
//            GeometryReader { geo in
//                Rectangle()
//                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .frame(width: 300, height: 200)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .rotation3DEffect(.degrees(-Double(self.dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
//                    .rotation3DEffect(.degrees(Double(self.dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
//                    .offset(self.dragAmount)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { self.dragAmount = $0.translation }
//                            .onEnded { _ in
//                                withAnimation(.spring()) {
//                                    self.dragAmount = .zero
//                                }
//                            }
//                    )
//            }
//        }
//    }
    
    
//    struct GridStack<Content: View>: View {
//        let rows: Int
//        let columns: Int
//        let content: (Int, Int) -> Content
//
//        var body: some View {
//            VStack {
//                ForEach(0 ..< rows, id: \.self) { row in
//                    HStack {
//                        ForEach(0 ..< self.columns, id: \.self) { column in
//                            self.content(row, column)
//                        }
//                    }
//                }
//            }
//        }
//
//        init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
//            self.rows = rows
//            self.columns = columns
//            self.content = content
//        }
//    }
//
//    var body: some View{
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "\(row * 4 + col).circle")
//            Text("R\(row) C\(col)")
//        }
//    }
    
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                self.showDetails.toggle()
            }) {
                Text("Show details")
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
