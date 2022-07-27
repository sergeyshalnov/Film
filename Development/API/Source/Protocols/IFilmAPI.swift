//
//  IFilmAPI.swift
//  API
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Network

public protocol IFilmAPI {
    /// <#Description#>
    /// - Parameters:
    ///   - id: <#id description#>
    ///   - completion: <#completion description#>
    /// - Returns: <#description#>
    @discardableResult
    func fetchFilm(id: Int, completion: @escaping (Result<FilmDetailsResponse, Swift.Error>) -> Void) -> IHTTPExecution?
}
