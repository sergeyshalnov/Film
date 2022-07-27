//
//  RootAssembly.swift
//  Film
//
//  Created by Sergey Shalnov on 04.07.2022.
//

final class RootAssembly {
    
    // MARK: - Public Properties

    lazy var serviceAssembly: IServiceAssembly = ServiceAssembly(coreAssembly: coreAssembly)

    // MARK: - Private Properties

    private lazy var coreAssembly: ICoreAssembly = CoreAssembly()
}
