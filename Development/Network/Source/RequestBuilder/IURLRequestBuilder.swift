//
//  IURLRequestBuilder.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public protocol IURLRequestBuilder {
    func buildURLRequest(from request: HTTPRequest) throws -> URLRequest
}
