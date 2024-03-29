//
//  HTTPResponse.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

struct HTTPStatus: Hashable {
    static let ok = HTTPStatus(rawValue: 200)
    static let badRequest = HTTPStatus(rawValue: 400)
    static let notFound = HTTPStatus(rawValue: 404)
    
    let rawValue: Int
    
    var localizedDescription: String? {
        switch self {
        case .notFound:
            return LocalizedString("error::notFound")
        default:
            return nil
        }
    }
    
    var isError: Bool {
        switch self {
        case .badRequest, .notFound:
            return true
        default:
            return false
        }
    }
}

struct HTTPResponse {
    let request: HTTPRequest
    private let response: HTTPURLResponse
    let body: Data?
    
    init(request: HTTPRequest, response: HTTPURLResponse, body: Data?) {
        self.request = request
        self.response = response
        self.body = body
    }
    
    var status: HTTPStatus {
        HTTPStatus(rawValue: response.statusCode)
    }
    
    var message: String {
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }
    
    var headers: [AnyHashable: Any] { response.allHeaderFields }
}
