//
//  UIView+Extensions.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview(_:))
    }
}
