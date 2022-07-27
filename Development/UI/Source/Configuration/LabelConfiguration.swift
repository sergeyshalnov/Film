//
//  LabelConfiguration.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

public struct LabelConfiguration: Equatable, Hashable {
    
    // MARK: - Public Properties
    
    public let text: String
    public let textColor: UIColor?
    public let font: UIFont
    public let textAlignment: NSTextAlignment
    public let numberOfLines: Int
    public let lineBreakMode: NSLineBreakMode
    // MARK: - Init
    
    public init(
        text: String,
        textColor: UIColor?,
        font: UIFont,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = .zero,
        lineBreakMode: NSLineBreakMode = .byClipping
    ) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
    }
}

// MARK: - Helpers

extension UILabel {
    public func configure(with configuration: LabelConfiguration) {
        text = configuration.text
        textColor = configuration.textColor
        font = configuration.font
        textAlignment = configuration.textAlignment
        numberOfLines = configuration.numberOfLines
        lineBreakMode = configuration.lineBreakMode
    }
}
