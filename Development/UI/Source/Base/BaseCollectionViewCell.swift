//
//  BaseCollectionViewCell.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import UIKit.UICollectionViewCell

open class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Init
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - Open
    
    open func commonInit() {
        configureView()
        configureConstraints()
        configureAppearance()
    }
    
    open func configureView() { }
    
    open func configureConstraints() { }
    
    open func configureAppearance() { }
    
    open func updateConfiguration() { }
}
