//
//  APIError.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 24/11/2021.
//

import Foundation

enum APIError: Error {
    case decodingError(DecodingError)
    case errorCode(Int)
    case unknown
    case general(Error)
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError(let decodingError):
            return decodingError.localizedDescription
        case .errorCode(let code):
            return "\(code) - something went wrong"
        case .unknown:
            return "the error is unknown"
        case .general(let error):
            return error.localizedDescription
        }
    }
}
