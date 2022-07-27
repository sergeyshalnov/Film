//
//  ImageConfiguration.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

public struct ImageConfiguration: Equatable, Hashable {
    
    // MARK: - Public Properties
    
    public let source: ImageSource
    public let tintColor: UIColor?
    
    // MARK: - Init
    
    public init(
        image: UIImage?,
        tintColor: UIColor? = nil
    ) {
        self.source = .local(image)
        self.tintColor = tintColor
    }
    
    public init(
        url: URL?,
        tintColor: UIColor? = nil
    ) {
        self.source = .remote(url)
        self.tintColor = tintColor
    }
    
    public init(
        source: ImageSource,
        tintColor: UIColor? = nil
    ) {
        self.source = source
        self.tintColor = tintColor
    }
}

// MARK: - Helpers

extension UIImageView {
    public func configure(with configuration: ImageConfiguration) {
        tintColor = configuration.tintColor
        
        switch configuration.source {
        case let .local(image):
            self.image = image
        case .remote:
            return
        }
    }
}
