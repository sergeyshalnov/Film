//
//  IFilmService.swift
//  Film
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

protocol IFilmsRepository {
    func fetchFilm(id: Int, completion: @escaping (Result<Film, FilmRepositoryError>) -> Void)
}
