//
//  FilmCollectionViewCellProvider.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

final class FilmCollectionViewCellProvider {
    func cell(_ collectionView: UICollectionView, at indexPath: IndexPath, using item: FilmItem) -> UICollectionViewCell? {
        switch item {
        case let .poster(configuration):
            let cell = collectionView.dequeueReusableCell(for: FilmPosterView.self, at: indexPath)
            
            cell?.innerContentView.configuration = configuration
                
            return cell
        case let .title(configuration),
            let .subtitle(configuration),
            let .description(configuration):
            
            let cell = collectionView.dequeueReusableCell(for: UILabel.self, at: indexPath)
            
            cell?.innerContentView.configure(with: configuration)
            cell?.contentInsets = UIEdgeInsets(horizontal: 16, vertical: .zero)
            
            return cell
        }
    }
}
