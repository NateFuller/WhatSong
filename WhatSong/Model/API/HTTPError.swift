//
//  HTTPError.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

typealias HTTPResult = Result<HTTPResponse, HTTPError>

struct HTTPError: Error {
    let code: Code
    let request: HTTPRequest
    let response: HTTPResponse?
    let underlyingError: Error?
    
    enum Code {
        case invalidRequest
        case cannotConnect
        case unknown
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
