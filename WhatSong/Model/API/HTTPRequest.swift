//
//  HTTPRequest.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/20/22.
//

import Foundation

struct HTTPMethod: Hashable {
    static let get = HTTPMethod(rawValue: "GET")
    static let post = HTTPMethod(rawValue: "POST")
    static let put = HTTPMethod(rawValue: "PUT")
    static let delete = HTTPMethod(rawValue: "DELETE")

    let rawValue: String
}

struct HTTPRequest {
    private var urlComponents = URLComponents()
    var method: HTTPMethod = .get
    var headers: [String: String] = [:]
    var body: HTTPBody = EmptyBody()
    
    init() {
        environment = APIClient.shared.environment
    }
    
    var url: URL? { urlComponents.url }
    
//    var scheme: String { urlComponents.scheme ?? "https" }
    var environment: Environment {
        didSet {
            urlComponents.host = environment.host
            urlComponents.port = environment.port
            urlComponents.scheme = environment.scheme
        }
    }
    
    var path: String {
        get { urlComponents.path }
        set { urlComponents.path = newValue }
    }
}

