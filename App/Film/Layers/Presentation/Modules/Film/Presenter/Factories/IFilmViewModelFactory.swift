//
//  FilmViewModelFactory.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

protocol IFilmViewModelFactory {
    func makeFilmViewModel(film: Film) -> FilmViewModel
    func makeAlertViewModel(error: Error, handler: @escaping (UIAlertAction) -> Void) -> AlertViewModel
}
