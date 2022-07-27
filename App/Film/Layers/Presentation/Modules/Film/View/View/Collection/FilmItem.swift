//
//  FilmItem.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI

enum FilmItem: Hashable {
    case poster(FilmPosterConfiguration)
    case title(LabelConfiguration)
    case subtitle(LabelConfiguration)
    case description(LabelConfiguration)
}
