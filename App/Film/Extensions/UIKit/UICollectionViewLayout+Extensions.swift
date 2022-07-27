//
//  UICollectionViewLayout.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

extension UICollectionViewLayout {
    static var collectionViewCellCompositionalLayout: UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(56))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let posterGroup = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)
        let titleGroup = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 2)
        
        titleGroup.interItemSpacing = .fixed(4)
        
        let headerItems = [posterGroup, titleGroup]
        let headerGroup = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: headerItems)
        
        headerGroup.interItemSpacing = .fixed(16)
        
        let bodyGroup = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        let sectionGroup = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [headerGroup, bodyGroup])
        
        sectionGroup.interItemSpacing = .fixed(32)
        
        let section = NSCollectionLayoutSection(group: sectionGroup)

        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: .zero, bottom: 16, trailing: .zero)
        section.interGroupSpacing = .zero

        return UICollectionViewCompositionalLayout(section: section)
    }
}
