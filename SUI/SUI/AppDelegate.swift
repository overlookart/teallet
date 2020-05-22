//
//  AppDelegate.swift
//  SUI
//
//  Created by mac on 2020/5/22.
//  Copyright © 2020 YYDDL. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle
    /*
    关于Scene的配置已默认在info.plist中进行，
    如果已在info.plist中配置过，不用实现该方法也没有关系。如果没有配置就需要实现这个方法并返回一个UISceneConfiguration对象。
    配置参数中Application Session Role 是个数组，每一项有三个参数:
    Configuration Name:   当前配置的名字;
    Delegate Class Name:  与哪个Scene代理对象关联;
    StoryBoard name: 这个Scene使用的哪个storyboard。
    注意：代理方法中调用的是配置名为Default Configuration的Scene，则系统就会自动去调用SceneDelegate这个类。这样SceneDelegate和AppDelegate产生了关联。
    */
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // 在分屏中关闭其中一个或多个scene时候回调用
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

