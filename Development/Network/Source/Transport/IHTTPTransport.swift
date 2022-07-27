//
//  IHTTPTransport.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public typealias HTTPResponseBlock = (Result<HTTPResponse, Error>) -> Void

public protocol IHTTPTransport {
    @discardableResult
    func execute(_ request: HTTPRequest, completion: HTTPResponseBlock?) -> IHTTPExecution
}
