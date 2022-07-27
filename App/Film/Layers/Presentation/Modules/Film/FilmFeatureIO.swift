//
//  FilmFeatureIO.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

// MARK: - FilmFeatureInput

protocol FilmFeatureInput: AnyObject { }

// MARK: - FilmFeatureOutput

protocol FilmFeatureOutput: AnyObject {
    func didRequestAlert(_ feature: FilmFeatureInput, alert: AlertViewModel)
}
