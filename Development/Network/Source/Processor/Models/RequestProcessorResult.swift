//
//  RequestProcessorResult.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public enum RequestProcessorResult<M, E> {
    public enum Error: Swift.Error {
        case unableToAccessAssociatedValue
        case unableToParseBothModel
    }

    case success(M)
    case backendError(E)
    case error(Swift.Error)

    // MARK: - Methods
    
    public func get() throws -> M {
        if case let .success(model) = self {
            return model
        }

        throw Error.unableToAccessAssociatedValue
    }

    public func getBackendError() throws -> E {
        if case let .backendError(error) = self {
            return error
        }

        throw Error.unableToAccessAssociatedValue
    }

    public func getError() throws -> Swift.Error {
        switch self {
        case let .error(error):
            return error
        default:
            throw Error.unableToAccessAssociatedValue
        }
    }
}
