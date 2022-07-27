//
//  FilmPresenter.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation
import UIKit

final class FilmPresenter {
    
    // MARK: - Dependencies
    
    weak var view: FilmViewInput?
    weak var output: FilmFeatureOutput?
    
    // MARK: - Private Properties
    
    private let filmRepository: IFilmsRepository
    private let filmViewModelFactory: IFilmViewModelFactory
    
    // MARK: - Init
    
    init(
        filmRepository: IFilmsRepository,
        filmViewModelFactory: IFilmViewModelFactory
    ) {
        self.filmRepository = filmRepository
        self.filmViewModelFactory = filmViewModelFactory
    }
}

// MARK: - FilmViewInput

extension FilmPresenter: FilmFeatureInput { }

// MARK: - FilmViewOutput

extension FilmPresenter: FilmViewOutput {
    func didRequestFilm() {
        filmRepository.fetchFilm(id: defaultFilmIdentifier) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case let .success(film):
                self.view?.didReceiveFilm(film: self.filmViewModelFactory.makeFilmViewModel(film: film))
            case let .failure(error):
                self.output?.didRequestAlert(
                    self,
                    alert: self.filmViewModelFactory.makeAlertViewModel(
                        error: error,
                        handler: { [weak self] _ in
                            self?.didRequestFilm()
                        }
                    )
                )
            }
        }
    }
    
    func didRequestRandomFilm() {
        // TODO: - Added request of random film
    }
}

// MARK: - Constants

private let defaultFilmIdentifier = 505
