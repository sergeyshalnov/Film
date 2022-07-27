//
//  FilmBackendError.swift
//  API
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

// Generated using https://app.quicktype.io/

struct FilmBackendError: Codable {
    let isSuccess: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
