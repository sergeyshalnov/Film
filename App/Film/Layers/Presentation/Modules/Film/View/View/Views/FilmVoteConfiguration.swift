//
//  FilmVoteConfiguration.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit.UIColor
import UI

struct FilmVoteConfiguration: Equatable, Hashable {
    
    // MARK: - Public Properties
    
    let title: LabelConfiguration
    let backgroundColor: UIColor
    
    // MARK: - Init
    
    init(
        title: LabelConfiguration,
        backgroundColor: UIColor = .systemGreen
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
    }
    
    init(
        text: String,
        backgroundColor: UIColor = .systemGreen
    ) {
        self.title = LabelConfiguration(
            text: text,
            textColor: .white,
            font: .systemFont(ofSize: 18, weight: .bold),
            textAlignment: .center
        )
        self.backgroundColor = backgroundColor
    }
}
