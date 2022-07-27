//
//  FilmDetailsResponse.swift
//  API
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation
import Network

// Generated using https://app.quicktype.io/

public struct FilmDetailsResponse: Codable {
    
    // MARK: - Public Properties
    
    public let id: Int
    public let budget: Int
    public let title: String
    public let originalTitle: String
    public let overview: String
    public let posterPath: String
    public let releaseDate: Date
    public let voteAverage: Double

    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case id
        case budget
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

// MARK: - DateFormatProvider

extension FilmDetailsResponse.CodingKeys: DateFormatProvider {
    public var dateFormat: String? {
        switch self {
        case .releaseDate:
            return "YYYY-MM-DD"
        case .id,
             .budget,
             .title,
             .originalTitle,
             .overview,
             .posterPath,
             .voteAverage:
            return nil
        }
    }
}

// MARK: - Internal

extension FilmDetailsResponse {
    func updating(
        id: Int? = nil,
        budget: Int? = nil,
        title: String? = nil,
        originalTitle: String? = nil,
        overview: String? = nil,
        posterPath: String? = nil,
        releaseDate: Date? = nil,
        voteAverage: Double? = nil
    ) -> FilmDetailsResponse {
        
        FilmDetailsResponse(
            id: id ?? self.id,
            budget: budget ?? self.budget,
            title: title ?? self.title,
            originalTitle: originalTitle ?? self.originalTitle,
            overview: overview ?? self.overview,
            posterPath: posterPath ?? self.posterPath,
            releaseDate: releaseDate ?? self.releaseDate,
            voteAverage: voteAverage ?? self.voteAverage
        )
    }
}
