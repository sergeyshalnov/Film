//
//  SceneDelegate.swift
//  Film
//
//  Created by Sergey Shalnov on 29.05.2022.
//

import UIKit

final class SceneDelegate: UIResponder {
    
    // MARK: - Internal Properties
    
    var window: UIWindow?
    
    // MARK: - Private Properties
    
    private let rootAssembly = RootAssembly()
    private lazy var rootCoordinatorFactory = RootCoordinatorFactory(serviceAssembly: rootAssembly.serviceAssembly)
    private lazy var rootCoordinator = RootCoordinator(window: window, rootCoordinatorFactory: rootCoordinatorFactory)
}

// MARK: - UIWindowSceneDelegate

extension SceneDelegate: UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        rootCoordinator.start()
    }
}

