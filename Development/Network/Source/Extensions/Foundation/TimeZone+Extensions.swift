//
//  TimeZone+Extensions.swift
//  Network
//
//  Created by Sergey Shalnov on 27.07.2022.
//

import Foundation

extension TimeZone {
    init?(iso8601: String) {
        let timeZone = iso8601.dropFirst(19) // remove yyyy-MM-ddTHH:mm:ss part

        if timeZone == "Z" {
            self.init(secondsFromGMT: 0)
        } else if timeZone.count == 3 { // assume +/-HH
            if let hour = Int(timeZone) {
                self.init(secondsFromGMT: hour * 3600)
                return
            }
        } else if timeZone.count == 5 { // assume +/-HHMM
            if let hour = Int(timeZone.dropLast(2)), let min = Int(timeZone.dropFirst(3)) {
                self.init(secondsFromGMT: (hour * 60 + min) * 60)
                return
            }
        } else if timeZone.count == 6 { // assime +/-HH:MM
            let parts = timeZone.components(separatedBy: ":")
            if parts.count == 2 {
                if let hour = Int(parts[0]), let min = Int(parts[1]) {
                    self.init(secondsFromGMT: (hour * 60 + min) * 60)
                    return
                }
            }
        }

        return nil
    }
}
