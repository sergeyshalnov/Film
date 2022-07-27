//
//  LabelConfiguration+Film.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UI

extension LabelConfiguration {
    static func filmTitle(text: String) -> LabelConfiguration {
        LabelConfiguration(
            text: text,
            textColor: .label,
            font: .systemFont(ofSize: 24, weight: .bold),
            textAlignment: .center
        )
    }
    
    static func filmSubtitle(text: String) -> LabelConfiguration {
        LabelConfiguration(
            text: text,
            textColor: .lightGray,
            font: .systemFont(ofSize: 16, weight: .regular),
            textAlignment: .center
        )
    }
    
    static func filmDescription(text: String) -> LabelConfiguration {
        LabelConfiguration(
            text: text,
            textColor: .label,
            font: .systemFont(ofSize: 18, weight: .regular)
        )
    }
}
