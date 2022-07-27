//
//  DateFormatProvider.swift
//  Network
//
//  Created by Sergey Shalnov on 27.07.2022.
//

public protocol DateFormatProvider: CodingKey {
    var dateFormat: String? { get }
}
