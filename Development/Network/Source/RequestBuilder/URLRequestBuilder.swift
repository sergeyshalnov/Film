//
//  HTTPRequestBuilder.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public final class URLRequestBuilder {
    enum Error: Swift.Error {
        case failedToCreateUrlRequest
    }
    
    // MARK: - Internal Properties
    
    public init() {}
}

// MARK: - IURLRequestBuilder

extension URLRequestBuilder: IURLRequestBuilder {
    public func buildURLRequest(from request: HTTPRequest) throws -> URLRequest {
        var query = request.baseURL
        
        if let path = request.path {
            query.append(path)
        }
        
        if !request.queryParameters.isEmpty {
            query.append("?" + buildParamsString(using: request.queryParameters))
        }
        
        guard let url = URL(string: query) else {
            throw Error.failedToCreateUrlRequest
        }
        
        var result = URLRequest(url: url)
        
        result.httpBody = request.body.map(serialize) ?? nil
        result.httpMethod = request.method.rawValue.uppercased()
        result.allHTTPHeaderFields = request.headers.mapValues { $0.description }
        result.timeoutInterval = request.timeoutInterval
        
        return result
    }
    
    private func serialize(with body: HTTPRequest.Body) -> Data? {
        switch body {
        case let .binary(data):
            return data
        case let .raw(string):
            return string.data(using: .utf8)
        case let .keyValue(dictionary):
            return buildParamsString(using: dictionary).data(using: .utf8)
        }
    }
    
    private func buildParamsString(using bodyParams: [String: CustomStringConvertible]) -> String {
        return bodyParams.map { $0.key + "=" + $0.value.description }.joined(separator: "&")
    }
}
