//
//  APIClient.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/20/22.
//

import Foundation

class APIClient {
    var environment: Environment
    
    static var shared = APIClient()
    
    private init() {
        #if DEBUG
        self.environment = .debug
        #else
        self.environment = .production
        #endif
    }
    
    func makeRequest() async throws -> User {
        guard let url = URL(string: "\(environment.domain)/create") else {
            throw User.UserError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}
