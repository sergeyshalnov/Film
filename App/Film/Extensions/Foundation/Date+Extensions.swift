//
//  Date+Extensions.swift
//  Film
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

extension Date {
    func year(calendar: Calendar = .current) -> Int? {
        calendar.dateComponents([.year], from: self).year
    }
}
