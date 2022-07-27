//
//  IRequestProcessor.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

public typealias RequestProcessorCompletion<M, E> = (RequestProcessorResult<M, E>) -> Void

public protocol IRequestProcessor {
    @discardableResult
    func process<M, E>(_ request: HTTPRequest, _ completion: RequestProcessorCompletion<M, E>?) -> IHTTPExecution?
}
