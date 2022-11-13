//
//  User.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/12/22.
//

import Foundation

struct User: Codable {
    var id: UUID?
    var createdAt: Date?
    var email: String
    var password: String?
    var profileImageURL: URL?
    var username: String?
//    var posts: [String]
    
    init(email: String, id: UUID? = nil, username: String? = nil, password: String? = nil, createdAt: Date? = nil, profileImageURL: URL? = nil) {
        self.email = email
        self.id = id
        self.username = username
        self.password = password
        self.createdAt = createdAt
        self.profileImageURL = profileImageURL
    }

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case email
        case username
        case password
        case profileImageURL
//        case posts
    }

    private static var debugMode = true

    enum UserError: Error {
        case invalidURL
        case missingData
    }

    /**
     Makes request to `/user/create`.

     - Parameter completion: The completion handler to handle either a successful or failed request.
     */
    func create(completion: @escaping (Result<User, Error>) -> Void) {
        // make request to server,
        // then if successful, return the user object from the response
        // if failed, oh well bye bye

        guard let url = URL(string: "https://whatsong.com/user/create") else {
            completion(.failure(UserError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard !User.debugMode else {
                completion(.success(User.Fixture.basic))

                return
            }

            if let response = response as? HTTPURLResponse, response.statusCode == 200 { // success
                if let data = data {
                    let decoder = JSONDecoder()

                    do {
                        let user = try decoder.decode(User.self, from: data)
                        completion(.success(user))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(UserError.missingData))
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    func update() -> User? {
        return nil
    }

    func delete() {

    }
}
