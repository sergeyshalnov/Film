//
//  HTTPRequest.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public struct HTTPRequest {
    
    // MARK: - Public Properties
    
    public var method: Method
    public var body: Body?
    public var baseURL: String
    public var path: String?
    public var queryParameters: [String: CustomStringConvertible]
    public var headers: [String: CustomStringConvertible]
    public var timeoutInterval: TimeInterval
    
    /// <#Description#>
    /// - Parameters:
    ///   - method: <#method description#>
    ///   - body: <#body description#>
    ///   - baseURL: <#baseURL description#>
    ///   - path: <#path description#>
    ///   - queryParameters: <#queryParameters description#>
    ///   - headers: <#headers description#>
    ///   - timeoutInterval: <#timeInterval description#>
    public init(
        method: HTTPRequest.Method,
        body: HTTPRequest.Body? = nil,
        baseURL: String,
        path: String? = nil,
        queryParameters: [String : CustomStringConvertible],
        headers: [String : CustomStringConvertible],
        timeoutInterval: TimeInterval
    ) {
        self.method = method
        self.body = body
        self.baseURL = baseURL
        self.path = path
        self.queryParameters = queryParameters
        self.headers = headers
        self.timeoutInterval = timeoutInterval
    }
    
    /// <#Description#>
    /// - Parameters:
    ///   - method: <#method description#>
    ///   - body: <#body description#>
    ///   - baseURL: <#baseURL description#>
    ///   - path: <#path description#>
    ///   - queryParameters: <#queryParameters description#>
    ///   - headers: <#headers description#>
    ///   - timeoutInterval: <#timeInterval description#>
    public init(
        method: HTTPRequest.Method,
        body: HTTPRequest.Body? = nil,
        baseURL: String,
        path: [String]? = nil,
        queryParameters: [String : CustomStringConvertible],
        headers: [String : CustomStringConvertible],
        timeoutInterval: TimeInterval
    ) {
        self.method = method
        self.body = body
        self.baseURL = baseURL
        self.path = path?.joined(separator: "/")
        self.queryParameters = queryParameters
        self.headers = headers
        self.timeoutInterval = timeoutInterval
    }
}

// MARK: - Method

public extension HTTPRequest {
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    enum Body {
        case raw(String)
        case binary(Data)
        case keyValue([String: CustomStringConvertible])
    }
}
