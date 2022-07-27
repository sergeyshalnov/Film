//
//  JSONDecoder+DateDecodingStrategy+BasedOnDateFormatProvider.swift
//  Network
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

extension JSONDecoder.DateDecodingStrategy {
    static func basedOnDateFormatProvider(defaultDateDecodingStrategy: @escaping (Decoder) throws -> Date) -> JSONDecoder.DateDecodingStrategy {
        return custom { decoder in
            if let date = try? basedOnDateFormatProviderDateDecodingStrategy(decoder: decoder) {
                return date
            }
            
            return try defaultDateDecodingStrategy(decoder)
        }
    }
    
    static func basedOnDateFormatProviderDateDecodingStrategy(decoder: Decoder) throws -> Date {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        
        guard let dateFormatProvider = container.codingPath.last as? DateFormatProvider else {
            let debugDescription = "Missing DateFormatProvider in codingPath"
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: debugDescription)
        }
        
        guard let dateFormat = dateFormatProvider.dateFormat else {
            let debugDescription = "Not found dateFormat for key: \(dateFormatProvider)"
            throw DecodingError.dataCorruptedError(in: container,
                                                   debugDescription: debugDescription)
        }
        
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = dateFormat
        
        guard let date = formatter.date(from: dateString) else {
            let debugDescription = "Fail to decode date string: \(dateString) with format: \(dateFormat)"
            throw DecodingError.dataCorruptedError(in: container, debugDescription: debugDescription)
        }
        
        return date
    }
}
