//
//  ImageSource.swift
//  UI
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation
import UIKit.UIImage

public enum ImageSource: Hashable {
    case local(UIImage?)
    case remote(URL?)
    
    // MARK: - Public Properties
    
    public var image: UIImage? {
        switch self {
        case let .local(image):
            return image
        case .remote:
            return nil
        }
    }
    
    public var url: URL? {
        switch self {
        case .local:
            return nil
        case let .remote(url):
            return url
        }
    }
}
