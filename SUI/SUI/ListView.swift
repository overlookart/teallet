//
//  ListView.swift
//  SUI
//
//  Created by CaiGou on 2023/12/27.
//  Copyright © 2023 YYDDL. All rights reserved.
//

import SwiftUI

struct ListView: View {
    let emojis: [Emoji] = Emoji.examples()
    var body: some View {
        List {
            ForEach(emojis){ i in
                Text(i.emojiString)
            }
        }
    }
}

struct Emoji: Identifiable {
    let value: Int
    
    var emojiString: String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
    
    var id: Int {
        return value
    }
    
    static func examples() -> [Emoji] {
        let values = 0x1f600...0x1f64f
        return values.map { Emoji(value: $0) }
    }
}

#Preview {
    ListView()
}
