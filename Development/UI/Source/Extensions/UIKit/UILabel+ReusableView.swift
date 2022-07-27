//
//  UILabel+ReusableView.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit.UILabel

extension UILabel: ReusableView {
    
    // MARK: - Static
    
    public static var reuseIdentifier: String {
        "UILabel"
    }
    
    // MARK: - Methods
    
    public func prepareForReuse() { }
}
