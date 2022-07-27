//
//  JSONDecoder+DateDecodingStrategy+CustomISO8601.swift
//  Network
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {

    // MARK: - Strategy

    static let customISO8601 = custom(customISO8601DateDecodingStrategy)

    // MARK: - Custom Decoding Strategies

    static func customISO8601DateDecodingStrategy(decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        let date = Formatter.iso8601.date(from: dateString) ?? Formatter.iso8601NoFractionalSeconds.date(from: dateString)

        guard let date = date else {
            let debugDescription = "Fail to decode date string: \(dateString)"
            throw DecodingError.dataCorruptedError(in: container, debugDescription: debugDescription)
        }

        return date
    }
}

// MARK: - Formatters

private extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()

    static let iso8601NoFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        return formatter
    }()
}
