//
//  ContentView.swift
//  SUI
//
//  Created by mac on 2020/5/22.
//  Copyright © 2020 YYDDL. All rights reserved.
//

import SwiftUI

/*
 所有视图必须遵循View协议
 该协议需要一个body计算属性，包含视图的实际布局
 
 *option + command + P 更新SwiftUI预览
 *option + command + enter 显示/隐藏预览窗口
 */

let formatterStr = "long textbstring"
let colors: [Color] = [.red, .green, .blue]
let results = [Result(score: 8), Result(score: 5), Result(score: 10)]
struct Result {
    var id = UUID()
    var score: Int
}

struct FavoritesView: View {
    //verticalSizeClass -- Regular
    //horizontalSizeClass -- Compact
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    var body: some View {
//        Text("This is an extremely \(formatterStr) that will never fit even the widest of Phones").tracking(20)
//            .lineLimit(2)
//            .truncationMode(Text.TruncationMode.middle)
//            .font(Font.title)
//            .multilineTextAlignment(TextAlignment.center)
//            .foregroundColor(Color.green)
//            .background(LinearGradient(gradient: Gradient(colors: [.white,.red,.black]), startPoint: .leading, endPoint: .trailing)).lineSpacing(50)
        
//        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
//        let conic = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)
//        return Circle()
//            .fill(conic)
//            .frame(width: 400, height: 400)
        
//        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
//        let conic = AngularGradient(gradient: colors, center: .center)
//        return Circle()
//            .fill(conic)
        
//        let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
//        let conic = AngularGradient(gradient: colors, center: .center, startAngle: .zero, endAngle: .degrees(360))
//        return Circle()
//            .strokeBorder(conic, lineWidth: 50)
        
//        Text("Hacking with Swift")
//        .font(.largeTitle)
//        .background(Circle()
//            .fill(Color.red)
//            .frame(width: 200, height: 200))
//            .clipped()
        
//        Rectangle()
//        .fill(Color.red)
//        .frame(width: 200, height: 200)
        
//        Circle()
//        .trim(from: 0, to: 0.5)
//        .frame(width: 200, height: 200)
        
//        VStack(spacing: 50) {
//            Text("SwiftUI")
//            Text("rocks")
//        }
        
//        VStack {
//            Text("SwiftUI")
//            Divider()
//            Text("rocks")
//        }
        
//        VStack(alignment: .leading) {
//            Text("SwiftUI")
//            Text("rocks")
//        }
        
//        VStack(alignment: .leading, spacing: 10) {
//            Text("SwiftUI")
//            Text("rocks")
//        }
        
//        VStack {
//            Spacer()
//            Text("SwiftUI")
//                .padding(.bottom)
//            Spacer()
//            Text("hsidf")
//            Spacer()
//        }
        
//
//        VStack {
//            Text("First Label")
//            Spacer()
//                .frame(minHeight: 50,maxHeight: 200)
//            Text("Second Label")
//        }
        
        
//        ZStack(alignment: .leading) {
//            Image("example-image")
//            Text("Hacking with Swift")
//                .font(.largeTitle)
//                .background(Color.black)
//                .foregroundColor(.white)
//        }
        
//        ZStack {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 50, height: 50)
//                .zIndex(1)
//
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 100)
//        }
        
//        VStack(alignment: .leading) {
//            ForEach((1...10).reversed(), id: \.self) {
//                Text("\($0)…")
//            }
//
//            Text("Ready or not, here I come!")
//        }
        
//        VStack {
//            ForEach(colors, id: \.self) { color in
//                Text(color.description.capitalized)
//                    .padding()
//                    .background(color)
//            }
//        }
        
//        VStack {
//            ForEach(results, id: \.id) { result in
//                Text("Result: \(result.score)")
//            }
//        }
        
//        if horizontalSizeClass == .compact {
//            return Text("Compact")
//        } else {
//            return Text("Regular")
//        }
        
//        Button(action: {
//            print("Button tapped")
//        }) {
//            Text("Welcome")
//                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
//                .font(.largeTitle)
//        }
        
        Text("Please log in")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.red).edgesIgnoringSafeArea(.all)
        
//
//        Image(systemName: "cloud.heavyrain.fill").resizable().aspectRatio(contentMode: .fit).foregroundColor(.red)
//            .font(.largeTitle)
//        guard let img = UIImage(named: "img") else {
//            fatalError("Unable to load image")
//        }
//        return Image(uiImage: img)
        
//        VStack {
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .kerning(50)
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .tracking(50)
//        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
#endif
