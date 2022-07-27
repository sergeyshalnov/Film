//
//  FilmCollectionViewLayout.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

final class FilmCollectionViewLayout: UICollectionViewCompositionalLayout {
    init() {
        let group = makeFilmSectionGroup()
        let section = NSCollectionLayoutSection(group: group)

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: .zero,
            bottom: 16,
            trailing: .zero
        )
        
        section.interGroupSpacing = .zero

        super.init(section: section)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Film Poster

private func makeFilmPosterGroup() -> NSCollectionLayoutGroup {
    let posterLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(56))
    let posterItem = NSCollectionLayoutItem(layoutSize: posterLayoutSize)
    let posterGroup = NSCollectionLayoutGroup.horizontal(layoutSize: posterLayoutSize, subitem: posterItem, count: 1)
    
    return posterGroup
}

// MARK: - Film Titles

private func makeFilmTitleGroup() -> NSCollectionLayoutGroup {
    let titleLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(56))
    let titleItem = NSCollectionLayoutItem(layoutSize: titleLayoutSize)
    let titleGroup = NSCollectionLayoutGroup.vertical(layoutSize: titleLayoutSize, subitem: titleItem, count: 2)
    
    titleGroup.interItemSpacing = .fixed(4)
    
    return titleGroup
}

// MARK: - Film Header

private func makeFilmHeaderGroup() -> NSCollectionLayoutGroup {
    let headerLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(56))
    let headerGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: headerLayoutSize,
        subitems: [
            makeFilmPosterGroup(),
            makeFilmTitleGroup()
        ]
    )
    
    headerGroup.interItemSpacing = .fixed(16)
    
    return headerGroup
}

// MARK: - Film Body

private func makeFilmBodyGroup() -> NSCollectionLayoutGroup {
    let bodyLayoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(56))
    let bodyItem = NSCollectionLayoutItem(layoutSize: bodyLayoutSize)
    
    return NSCollectionLayoutGroup.vertical(layoutSize: bodyLayoutSize, subitems: [bodyItem])
}

// MARK: - Film

private func makeFilmSectionGroup() -> NSCollectionLayoutGroup {
    let layoutSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .estimated(56)
    )
    
    let group = NSCollectionLayoutGroup.vertical(
        layoutSize: layoutSize,
        subitems: [
            makeFilmHeaderGroup(),
            makeFilmBodyGroup()
        ]
    )
    
    group.interItemSpacing = .fixed(32)
    
    return group
}
