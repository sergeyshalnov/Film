//
//  MovieDataBaseAPI.swift
//  API
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Network

public final class MovieDataBaseAPI {
    public enum Error: Swift.Error {
        case internalError
    }
    
    // MARK: - Private Properties
    
    private let requestProcessor: IRequestProcessor
    private let apiKey: String
    
    // MARK: - Init
    
    public init(
        requestProcessor: IRequestProcessor,
        apiKey: String? = nil
    ) {
        self.requestProcessor = requestProcessor
        self.apiKey = apiKey ?? defaultApiKey
    }
}

// MARK: - IFilmAPI

extension MovieDataBaseAPI: IFilmAPI {
    @discardableResult
    public func fetchFilm(id: Int, completion: @escaping (Result<FilmDetailsResponse, Swift.Error>) -> Void) -> IHTTPExecution? {
        let httpRequest = HTTPRequest(
            method: .get,
            body: .none,
            baseURL: movieDataBaseURL,
            path: [moviePath, String(id)],
            queryParameters: [apiKeySnakeCase: apiKey],
            headers: [:],
            timeoutInterval: defaultTimeout
        )
        
        let completion: RequestProcessorCompletion<FilmDetailsResponse, FilmBackendError> = { response in
            switch response {
            case let .success(filmDetails):
                completion(
                    .success(
                        filmDetails.updating(
                            posterPath: makePosterPath(movieDataBaseImagePath: filmDetails.posterPath)
                        )
                    )
                )
            case let .backendError(backendError):
                #if DEBUG
                print(#function, backendError.statusCode, backendError.statusMessage)
                #endif
                
                completion(.failure(Error.internalError))
            case let .error(error):
                completion(.failure(error))
            }
        }
        
        return requestProcessor.process(httpRequest, completion)
    }
}

// MARK: - Private

private func makePosterPath(movieDataBaseImagePath: String) -> String {
    movieDataBaseImageURL + movieDataBaseImagePath
}

// MARK: - Constants

private let defaultTimeout: TimeInterval = 10
private let movieDataBaseURL = "https://api.themoviedb.org/3/"
private let movieDataBaseImageURL = "https://image.tmdb.org/t/p/w500"
private let moviePath = "movie"
private let apiKeySnakeCase = "api_key"
private let defaultApiKey = "279a2c4ba387e2d59cddde5efc67a1c3"
