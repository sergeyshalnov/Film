//
//  RootCoordinatorFactory.swift
//  Film
//
//  Created by Sergey Shalnov on 04.07.2022.
//

import UIKit

final class RootCoordinatorFactory {
    
    // MARK: - Private Properties
    
    private let serviceAssembly: IServiceAssembly
    
    // MARK: - Init
    
    init(serviceAssembly: IServiceAssembly) {
        self.serviceAssembly = serviceAssembly
    }
    
    // MARK: - Methods
    
    func makeRootViewController(output: FilmFeatureOutput) -> Feature<FilmFeatureInput> {
        FilmFeatureBuilder(filmRepository: serviceAssembly.filmRepository).build(output: output)
    }
}
