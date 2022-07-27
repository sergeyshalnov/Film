//
//  AppDelegate.swift
//  Film
//
//  Created by Sergey Shalnov on 29.05.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder { }

// MARK: - UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        return true
    }
}

// MARK: - UISceneSession Lifecycle

extension AppDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
