//
//  FilmFeatureBuilder.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

final class FilmFeatureBuilder {
    
    // MARK: - Private Properties
    
    private let filmRepository: IFilmsRepository
    
    // MARK: - Init
    
    init(filmRepository: IFilmsRepository) {
        self.filmRepository = filmRepository
    }
    
    // MARK: - Public
    
    func build(output: FilmFeatureOutput) -> Feature<FilmFeatureInput> {
        let view = makeView()
        let presenter = makePresenter()
        
        presenter.view = view
        presenter.output = output
        view.output = presenter
        
        return Feature(viewController: view, input: presenter)
    }
    
    // MARK: - Private
    
    func makeView() -> FilmViewController {
        FilmViewController()
    }
    
    func makePresenter() -> FilmPresenter {
        FilmPresenter(
            filmRepository: filmRepository,
            filmViewModelFactory: FilmViewModelFactory()
        )
    }
}
