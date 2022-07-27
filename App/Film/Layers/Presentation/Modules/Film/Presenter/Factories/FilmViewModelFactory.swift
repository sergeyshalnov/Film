//
//  FilmViewModelFactory.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

final class FilmViewModelFactory: IFilmViewModelFactory {
    func makeFilmViewModel(film: Film) -> FilmViewModel {
        let subtitle = film.releaseDate.year().map { String($0) }
        
        return FilmViewModel(
            poster: film.poster,
            title: film.title,
            subtitle: subtitle ?? .empty,
            description: film.overview,
            voteAverage: String(film.voteAverage)
        )
    }
    
    func makeAlertViewModel(error: Error, handler: @escaping (UIAlertAction) -> Void) -> AlertViewModel {
        AlertViewModel(
            title: "Error",
            message: "Something happend...",
            action: AlertActionViewModel(
                title: "Refresh",
                style: .default,
                handler: handler
            )
        )
    }
}
