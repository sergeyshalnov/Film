//
//  ReusableView.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

public protocol ReusableView {
    
    // MARK: - Properties
    
    static var reuseIdentifier: String { get }
    
    // MARK: - Methods
    
    func prepareForReuse()
}
