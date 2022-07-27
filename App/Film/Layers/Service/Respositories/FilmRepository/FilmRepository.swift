//
//  FilmRepository.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation
import API

final class FilmRepository {
    
    // MARK: - Private Properties
    
    private let filmAPI: IFilmAPI
    
    // MARK: - Init
    
    init(filmAPI: IFilmAPI) {
        self.filmAPI = filmAPI
    }
}

// MARK: - IFilmsRepository

extension FilmRepository: IFilmsRepository {
    func fetchFilm(id: Int, completion: @escaping (Result<Film, FilmRepositoryError>) -> Void) {
        filmAPI.fetchFilm(id: id) { result in
            convert(result: result, completion: completion)
        }
    }
}

// MARK: - Private

private func convert(result: Result<FilmDetailsResponse, Error>, completion: @escaping (Result<Film, FilmRepositoryError>) -> Void) {
    completion(
        result
            .map { response in
                Film(
                    poster: URL(string: response.posterPath),
                    title: response.title,
                    overview: response.overview,
                    releaseDate: response.releaseDate,
                    voteAverage: response.voteAverage
                )
            }
            .mapError { error in
                FilmRepositoryError.internalError
            }
    )
}
