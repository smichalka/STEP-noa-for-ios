//
//  OpenAIError.swift
//  arGPT
//
//  Created by Bart Trzynadlowski on 5/24/23.
//

import Foundation

public enum OpenAIError: Error {
    case urlAuthenticationFailed
    case responsePayloadParseError
    case clientSideNetworkError(error: Error?)
    case apiError(message: String)
}


extension OpenAIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .clientSideNetworkError(let error):
            if let error = error {
                return "Network request failed: \(error.localizedDescription)"
            } else {
                return "Network request failed."
            }
        case .responsePayloadParseError:
            return "Unable to parse response from OpenAI server."
        case .apiError(let message):
            return message
        case .urlAuthenticationFailed:
            return "OpenAI API URL authentication failed."
        }
    }
}
