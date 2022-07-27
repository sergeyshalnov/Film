//
//  RequestProcessor.swift
//  Network
//
//  Created by Sergey Shalnov on 26.07.2022.
//

public final class RequestProcessor: IRequestProcessor {
    
    // MARK: - Private Properties

    private let transport: IHTTPTransport
    private let parser: IDataParser
    private let responseQueue: TaskDispatcher

    // MARK: - Init

    public init(
        transport: IHTTPTransport,
        parser: IDataParser,
        responseQueue: TaskDispatcher
    ) {
        self.transport = transport
        self.parser = parser
        self.responseQueue = responseQueue
    }

    // MARK: - IRequestProcessor

    @discardableResult
    public func process<M, E>(_ request: HTTPRequest, _ completion: RequestProcessorCompletion<M, E>?) -> IHTTPExecution? {
        return transport.execute(request) { result in
            do {
                let httpResponse = try result.get()
                let response: RequestProcessorResult<M, E> = self.parseResponse(request, httpResponse)
                
                self.responseQueue.dispatchAsync {
                    completion?(response)
                }
            } catch {
                self.responseQueue.dispatchAsync {
                    completion?(.error(error))
                }
            }
        }
    }

    // MARK: - Private Methods

    private func parseResponse<M, E>(_ request: HTTPRequest, _ response: HTTPResponse) -> RequestProcessorResult<M, E> {
        do {
            return .success(try parser.parse(response.data))
        } catch {
            #if DEBUG
            print(#function, String(describing: error))
            #endif
        }

        do {
            return .backendError(try parser.parse(response.data))
        } catch {
            return .error(error)
        }
    }
}
