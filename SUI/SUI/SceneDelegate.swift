//
//  SceneDelegate.swift
//  SUI
//
//  Created by CaiGou on 2024/7/10.
//  Copyright © 2024 YYDDL. All rights reserved.
//

import Foundation
import UIKit
class SceneDelegate: NSObject, UIWindowSceneDelegate, ObservableObject {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem) async -> Bool {
        
        return true
    }
}
