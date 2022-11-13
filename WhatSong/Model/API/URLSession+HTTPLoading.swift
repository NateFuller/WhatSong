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
        
        var (data, urlResponse): (Data, URLResponse)
        
        do {
            (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            guard let urlResponse = urlResponse as? HTTPURLResponse else {
                return .failure(HTTPError(code: .unknown, request: request))
            }
            
            let httpResponse = HTTPResponse(request: request, response: urlResponse, body: data)
            guard !httpResponse.status.isError else {
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                let reason = json?["reason"] as? String
                return .failure(HTTPError(code: .httpError(status: httpResponse.status),
                                          reason: reason,
                                          request: request,
                                          response: httpResponse))
            }
            
            return .success(httpResponse)
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
