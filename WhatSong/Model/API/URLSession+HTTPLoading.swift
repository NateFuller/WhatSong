//
//  URLSession+HTTPLoading.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation

protocol HTTPLoading {
    func load(request: HTTPRequest) async throws -> HTTPResult
}

extension URLSession: HTTPLoading {
    func load(request: HTTPRequest) async throws -> HTTPResult {
        guard let url = request.url else {
            return .failure(HTTPError(code: .invalidRequest, request: request))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        for (header, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: header)
        }
        
        if !request.body.isEmpty {
            for (header, value) in request.body.additionalHeaders {
                urlRequest.addValue(value, forHTTPHeaderField: header)
            }
            
            do {
                urlRequest.httpBody = try request.body.encode()
            } catch {
                return .failure(HTTPError(code: .invalidRequest, request: request, underlyingError: error))
            }
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse else {
            return .failure(HTTPError(code: .unknown, request: request))
        }
        
        return .success(HTTPResponse(request: request, response: response, body: data))
    }
}
