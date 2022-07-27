//
//  ServiceAssembly.swift
//  Film
//
//  Created by Sergey Shalnov on 04.07.2022.
//

import API
import Network

final class ServiceAssembly: IServiceAssembly {
    
    // MARK: - Private Properties
    
    private let coreAssembly: ICoreAssembly
    
    // MARK: - Public Properties
    
    private(set) lazy var filmRepository: IFilmsRepository = FilmRepository(filmAPI: coreAssembly.filmAPI)

    // MARK: - Init
    
    init(coreAssembly: ICoreAssembly) {
        self.coreAssembly = coreAssembly
    }
}
