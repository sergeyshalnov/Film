//
//  JSONDataParser.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public final class JSONDataParser: IDataParser {
    private enum Error: Swift.Error {
        case typeIsNotDecodable
        case unableToDecode
    }

    // MARK: - Private Properties
    
    private let decoder: JSONDecoder

    // MARK: - Init
    
    public init(decoder: JSONDecoder? = nil) {
        self.decoder = decoder ?? .withDateDecodingStrategy
    }

    // MARK: - IDataParser
    
    public func parse<Model>(_ data: Data) throws -> Model {
        if let decodableType = Model.self as? Decodable.Type {
            let decodedModel = try decodableType.init(data, decoder) as? Model

            return try decodedModel.orThrow(Error.unableToDecode)
        }

        if let void = () as? Model {
            return void
        }

        throw Error.typeIsNotDecodable
    }
}

// MARK: - Helpers

private extension Decodable {
    init(_ encodedData: Data, _ decoder: JSONDecoder) throws {
        self = try decoder.decode(Self.self, from: encodedData)
    }
}
