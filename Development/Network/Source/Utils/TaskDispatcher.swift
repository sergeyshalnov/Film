//
//  TaskDispatcher.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

public protocol TaskDispatcher {
    /// <#Description#>
    /// - Parameter block: <#block description#>
    func dispatchAsync(_ block: @escaping () -> Void)
    /// <#Description#>
    /// - Parameters:
    ///   - delay: <#delay description#>
    ///   - block: <#block description#>
    func dispatchAsyncAfter(_ delay: TimeInterval, _ block: @escaping () -> Void)
}

// MARK: - DispatchQueue

extension DispatchQueue: TaskDispatcher {
    public func dispatchAsync(_ block: @escaping () -> Void) {
        async(execute: block)
    }

    public func dispatchAsyncAfter(_ delay: TimeInterval, _ block: @escaping () -> Void) {
        asyncAfter(deadline: DispatchTime.now() + delay, execute: block)
    }
}
