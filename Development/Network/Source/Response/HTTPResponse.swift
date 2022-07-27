//
//  HTTPResponse.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public struct HTTPResponse {
    
    // MARK: - Public Properties
    
    public let data: Data
    public let statusCode: Int
    public let headers: [String: String]

    // MARK: - Init
    
    public init(
        data: Data,
        statusCode: Int,
        headers: [String: String]
    ) {
        self.data = data
        self.statusCode = statusCode
        self.headers = headers
    }
}
