//
//  Optional+Extensions.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

import Foundation

extension Optional {
    /// <#Description#>
    /// - Parameter error: <#error description#>
    /// - Returns: <#description#>
    func orThrow(_ error: @autoclosure () -> Error) throws -> Wrapped {
        if let value = self {
            return value
        }

        throw error()
    }
    
    /// <#Description#>
    /// - Parameter default: <#default description#>
    /// - Returns: <#description#>
    func or(_ default: @autoclosure () -> Wrapped) -> Wrapped {
        return self ?? `default`()
    }
}
