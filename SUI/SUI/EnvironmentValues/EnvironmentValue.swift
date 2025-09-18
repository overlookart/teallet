//
//  Environment.swift
//  SUI
//
//  Created by CaiGou on 2025/9/12.
//  Copyright © 2025 YYDDL. All rights reserved.
//

import SwiftUI


struct EnvironmentValue: View {
    
    @Environment(\.layoutDirection) var layoutDirection: LayoutDirection
    @Environment(\.controlSize) var controlSize: ControlSize
    @Environment(\.multilineTextAlignment) var multilineTextAlignment: TextAlignment
    @Environment(\.truncationMode) var truncationMode: Text.TruncationMode
    @Environment(\.lineSpacing) var lineSpacing: CGFloat
    @Environment(\.allowsTightening) var allowsTightening: Bool
    @Environment(\.minimumScaleFactor) var minimumScaleFactor: CGFloat
    @Environment(\.textCase) var textCase: Text.Case?
    @Environment(\.lineLimit) var lineLimit: Int?
    @Environment(\.dynamicTypeSize) var dynamicTypeSize: DynamicTypeSize
    @Environment(\.headerProminence) var headerProminence: Prominence
    @Environment(\.symbolVariants) var symbolVariants: SymbolVariants
    @Environment(\.font) var font: Font?
    @Environment(\.imageScale) var imageScale: Image.Scale
    @Environment(\.displayScale) var displayScale: CGFloat
    @Environment(\.pixelLength) var pixelLength: CGFloat
    @Environment(\.legibilityWeight) var legibilityWeight: LegibilityWeight?
    @Environment(\.locale) var locale: Locale
    @Environment(\.calendar) var calendar: Calendar
    @Environment(\.timeZone) var timeZone: TimeZone
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    /// 系统偏好设置--辅助功能
    @Environment(\.accessibilityEnabled) var accessibilityEnabled: Bool
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor: Bool
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency: Bool
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion: Bool
    @Environment(\.accessibilityInvertColors) var accessibilityInvertColors: Bool
    @Environment(\.accessibilityShowButtonShapes) var accessibilityShowButtonShapes: Bool
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.colorSchemeContrast) var colorSchemeContrast: ColorSchemeContrast
    
    struct EnvironmentValueData: Identifiable {
        var id: UUID = UUID()
        var title: String
        var value: String
        
        init(title: String, value: Sendable) {
            self.title = title
            self.value = String(describing: value)
        }
    }
    
    @State private var data: [EnvironmentValueData] = []
    
    var body: some View {
        List(data){ item in
            HStack {
                Text(item.title)
                Spacer()
                Text(item.value)
            }
        }
        .navigationTitle("Environment values")
        .onAppear {
            debugPrint("进入页面")
            setupData()
        }
        .onDisappear {
            debugPrint("离开页面")
        }
    }
    
    
    private func setupData(){
        data = [
            .init(title: "layoutDirection", value: layoutDirection),
            .init(title: "controlSize", value: controlSize),
            .init(title: "multilineTextAlignment", value: multilineTextAlignment),
            .init(title: "truncationMode", value: truncationMode),
            .init(title: "lineSpacing", value: lineSpacing),
            .init(title: "allowsTightening", value: allowsTightening),
            .init(title: "minimumScaleFactor", value: minimumScaleFactor),
            .init(title: "textCase", value: textCase),
            .init(title: "lineLimit", value: lineLimit),
            .init(title: "dynamicTypeSize", value: dynamicTypeSize),
            .init(title: "headerProminence", value: headerProminence),
            .init(title: "symbolVariants", value: symbolVariants),
            .init(title: "font", value: font),
            .init(title: "imageScale", value: imageScale),
            .init(title: "displayScale", value: displayScale),
            .init(title: "pixelLength", value: pixelLength),
            .init(title: "legibilityWeight", value: legibilityWeight),
            .init(title: "locale", value: locale),
            .init(title: "calendar", value: calendar),
            .init(title: "timeZone", value: timeZone),
            .init(title: "horizontalSizeClass", value: horizontalSizeClass),
            .init(title: "verticalSizeClass", value: verticalSizeClass),
            .init(title: "accessibilityEnabled", value: accessibilityEnabled),
            .init(title: "accessibilityDifferentiateWithoutColor", value: accessibilityDifferentiateWithoutColor),
            .init(title: "accessibilityReduceTransparency", value: accessibilityReduceTransparency),
            .init(title: "accessibilityReduceMotion", value: accessibilityReduceMotion),
            .init(title: "accessibilityInvertColors", value: accessibilityInvertColors),
            .init(title: "accessibilityShowButtonShapes", value: accessibilityShowButtonShapes),
            .init(title: "colorScheme", value: colorScheme),
            .init(title: "colorSchemeContrast", value: colorSchemeContrast)
            
        ]
    }
}

#Preview {
    EnvironmentValue()
}
