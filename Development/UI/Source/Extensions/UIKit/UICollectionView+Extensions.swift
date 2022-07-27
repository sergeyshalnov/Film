//
//  UICollectionView+Extensions.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit.UICollectionView

extension UICollectionView {
    public func register(_ cellType: (UICollectionViewCell & ReusableView).Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    public func dequeueReusableCell<T: UIView & ReusableView>(for type: T.Type, at indexPath: IndexPath) -> CollectionViewCell<T>? {
        let cell = dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell<T>.reuseIdentifier,
            for: indexPath
        )
        
        return cell as? CollectionViewCell<T>
    }
}
