//
//  UserService.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/23/22.
//

import Foundation

class UserService {
    private let loader: HTTPLoading = URLSession.shared
    
    func create(_ user: User) async throws -> User {
        var request = HTTPRequest()
        request.host = APIClient.shared.environment.domain
        request.path = "/user/create"
        request.method = .post
        request.body = JSONBody(user)
        
        let result = try await loader.load(request: request)
        
        
        switch result {
        case .success(let response):
            guard let body = response.body else {
                throw HTTPError(code: .unknown, request: request)
            }
            
            return try JSONDecoder().decode(User.self, from: body)
        case .failure(let error):
            throw error
        }
    }
}
