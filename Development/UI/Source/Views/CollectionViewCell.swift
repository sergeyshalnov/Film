//
//  CollectionViewCell.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

open class CollectionViewCell<ContentView: UIView & ReusableView>: BaseCollectionViewCell, ReusableView {
    
    // MARK: - ReusableView
    
    public static var reuseIdentifier: String {
        "CollectionViewCell.\(ContentView.reuseIdentifier)"
    }
    
    // MARK: - UI
    
    public let innerContentView = ContentView()
    
    // MARK: - Private Properties
    
    private lazy var leadingConstraint = innerContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: contentInsets.left)
    private lazy var trailingConstraint = innerContentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -contentInsets.right)
    private lazy var topConstraint = innerContentView.topAnchor.constraint(equalTo: topAnchor, constant: contentInsets.top)
    private lazy var bottomConstraint = innerContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -contentInsets.bottom)
    
    // MARK: - Public Properties
    
    public var contentInsets: UIEdgeInsets = .zero {
        didSet {
            setNeedsUpdateConstraints()
        }
    }
    
    // MARK: - Overriden
    
    override public func configureView() {
        addSubview(innerContentView)
    }
    
    override public func configureConstraints() {
        innerContentView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            leadingConstraint,
            trailingConstraint,
            topConstraint,
            bottomConstraint
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse()
        innerContentView.prepareForReuse()
    }
    
    open override func updateConstraints() {
        super.updateConstraints()
        
        leadingConstraint.constant = contentInsets.left
        trailingConstraint.constant = -contentInsets.right
        topConstraint.constant = contentInsets.top
        bottomConstraint.constant = -contentInsets.bottom
    }
}
