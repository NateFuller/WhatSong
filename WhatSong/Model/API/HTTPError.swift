//
//  HTTPError.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

typealias HTTPResult = Result<HTTPResponse, HTTPError>

struct HTTPError: LocalizedError {
    let code: Code
    let reason: String?
    let request: HTTPRequest
    let response: HTTPResponse?
    let underlyingError: Error?
    
    init(code: Code,
         reason: String? = nil,
         request: HTTPRequest,
         response: HTTPResponse? = nil,
         underlyingError: Error? = nil) {
        self.code = code
        self.reason = reason
        self.request = request
        self.response = response
        self.underlyingError = underlyingError
    }
    
    enum Code {
        case httpError(status: HTTPStatus)
        case cannotConnect
        case invalidRequest
        case unknown
    }
    
    var errorDescription: String? {
        switch code {
        case .httpError(let status):
            return reason ?? status.localizedDescription
        case .cannotConnect:
            return LocalizedString("error::cannotConnect")
        case .invalidRequest:
            return LocalizedString("error::invalidRequest")
        case .unknown:
            return LocalizedString("error::unknown")
        }
    }
}

extension HTTPResult {
    var request: HTTPRequest {
        switch self {
        case .success(let response): return response.request
        case .failure(let error): return error.request
        }
    }
    
    var response: HTTPResponse? {
        switch self {
        case .success(let response): return response
        case .failure(let error): return error.response
        }
    }
}
