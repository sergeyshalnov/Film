//
//  FilmPosterConfiguration.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI

struct FilmPosterConfiguration: Equatable, Hashable {
    
    // MARK: - Public Properties
    
    let posterConfiguration: ImageConfiguration
    let voteConfiguration: FilmVoteConfiguration
    
    // MARK: - Internal Properties
    
    init(
        posterConfiguration: ImageConfiguration = ImageConfiguration(source: .local(nil)),
        voteConfiguration: FilmVoteConfiguration = FilmVoteConfiguration(text: .empty)
    ) {
        self.posterConfiguration = posterConfiguration
        self.voteConfiguration = voteConfiguration
    }
}
