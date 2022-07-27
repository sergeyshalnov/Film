//
//  FilmViewInput.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

// MARK: - FilmViewInput

protocol FilmViewInput: AnyObject {
    func didReceiveFilm(film: FilmViewModel)
    func didReceiveRandomFilm(film: FilmViewModel)
}

// MARK: - FilmViewOutput

protocol FilmViewOutput: AnyObject {
    func didRequestFilm()
    func didRequestRandomFilm()
}
