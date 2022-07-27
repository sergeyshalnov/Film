//
//  URLSessionTransport.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public final class URLSessionTransport: IHTTPTransport {
    enum Error: Swift.Error {
        case responseDataIsMissing
        case responseIsMissing
        case unknownStatusCode
        case failedToCreateUrlRequest
        case failedToExtractHeaders
    }

    private let session: URLSession
    private let requestBuilder: IURLRequestBuilder

    // MARK: - Init
    
    public init(session: URLSession, requestBuilder: IURLRequestBuilder) {
        self.session = session
        self.requestBuilder = requestBuilder
    }

    @discardableResult
    public func execute(_ request: HTTPRequest, completion: HTTPResponseBlock?) -> IHTTPExecution {
        guard let request = try? requestBuilder.buildURLRequest(from: request) else {
            completion?(.failure(Error.failedToCreateUrlRequest))
            return VoidHTTPExecution()
        }

        let task = session.dataTask(with: request) { data, response, error in
            completion?(.init(catching: {
                let data = try data.orThrow(error.or(Error.responseDataIsMissing))
                let response = try response.orThrow(Error.responseIsMissing)
                let statusCode = try response.rawStatusCode.orThrow(Error.unknownStatusCode)
                let headers = try response.headerFields.orThrow(Error.failedToExtractHeaders)
                
                return HTTPResponse(
                    data: data,
                    statusCode: statusCode,
                    headers: headers
                )
            }))
        }

        task.resume()

        return task
    }
}

// MARK: - Helpers

private extension URLResponse {
    var rawStatusCode: Int? {
        (self as? HTTPURLResponse)?.statusCode
    }
    
    var headerFields: [String: String]? {
        (self as? HTTPURLResponse)?.allHeaderFields as? [String: String]
    }
}

private class VoidHTTPExecution: IHTTPExecution {
    func cancel() {}
}
