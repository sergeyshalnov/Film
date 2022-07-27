//
//  IDataParser.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

public protocol IDataParser {
    func parse<Model>(_ data: Data) throws -> Model
}
