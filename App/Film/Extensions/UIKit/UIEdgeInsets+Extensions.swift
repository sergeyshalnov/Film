//
//  UIEdgeInsets+Extensions.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

extension UIEdgeInsets {
    init(horizontal: CGFloat = .zero, vertical: CGFloat = .zero) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
}
