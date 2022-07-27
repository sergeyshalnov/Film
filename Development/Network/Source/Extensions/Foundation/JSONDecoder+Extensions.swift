//
//  JSONDecoder+Extensions.swift
//  Network
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

extension JSONDecoder {
    static var withDateDecodingStrategy: JSONDecoder {
        let decoder = JSONDecoder()
        
        let defaultDateDecodingStrategy = JSONDecoder
            .DateDecodingStrategy
            .customISO8601DateDecodingStrategy
        
        let dateDecodingStrategy = JSONDecoder
            .DateDecodingStrategy
            .basedOnDateFormatProvider(defaultDateDecodingStrategy: defaultDateDecodingStrategy)
        
        decoder.dateDecodingStrategy = dateDecodingStrategy
        
        return decoder
    }
}
