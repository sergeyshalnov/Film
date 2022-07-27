//
//  RootCoordinator.swift
//  Film
//
//  Created by Sergey Shalnov on 04.07.2022.
//

import UIKit

final class RootCoordinator {
    
    // MARK: - Private Properties
    
    private weak var window: UIWindow?
    private let rootCoordinatorFactory: RootCoordinatorFactory
    
    // MARK: - Init
    
    init(window: UIWindow?, rootCoordinatorFactory: RootCoordinatorFactory) {
        self.window = window
        self.rootCoordinatorFactory = rootCoordinatorFactory
    }
    
    // MARK: - Methods
    
    func start() {
        let feature = rootCoordinatorFactory.makeRootViewController(output: self)
        
        window?.rootViewController = feature.viewController
        window?.makeKeyAndVisible()
    }
}

// MARK: - FilmFeatureOutput

extension RootCoordinator: FilmFeatureOutput {
    func didRequestAlert(_ feature: FilmFeatureInput, alert: AlertViewModel) {
        let alertController = UIAlertController(title: alert.title, message: alert.message, preferredStyle: .alert)
        
        alert.actions.forEach { action in
            alertController.addAction(
                UIAlertAction(title: action.title, style: action.style, handler: action.handler)
            )
        }
        
        window?.rootViewController?.present(alertController, animated: true)
    }
}
