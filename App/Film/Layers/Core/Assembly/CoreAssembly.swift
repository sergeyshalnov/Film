//
//  CoreAssembly.swift
//  Film
//
//  Created by Sergey Shalnov on 04.07.2022.
//

import API
import Foundation
import Network

final class CoreAssembly: ICoreAssembly {
    
    // MARK: - Private Properties
    
    private let urlSession = URLSession(configuration: .default)
    private let responseQueue = DispatchQueue.global()
    // MARK: - ICoreAssembly
    
    private(set) lazy var filmAPI: IFilmAPI = MovieDataBaseAPI(
        requestProcessor: RequestProcessor(
            transport: URLSessionTransport(
                session: urlSession,
                requestBuilder: URLRequestBuilder()
            ),
            parser: JSONDataParser(),
            responseQueue: responseQueue
        )
    )
}
