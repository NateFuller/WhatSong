//
//  User.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/12/22.
//

import Foundation

struct User: Codable {
    var username: String
    var password: String?
    var profilePictureURL: URL?
    var posts: [Post] = []

    enum CodingKeys: String, CodingKey {
        case username
        case password
        case profilePictureURL = "profile_picture_url"
        case posts
    }

    private static var debugMode = true

    init(username: String, password: String?, profilePictureURL: URL?) {
        self.username = username
        self.password = password
        self.profilePictureURL = profilePictureURL
    }

    init(username: String, profilePictureURL: URL?, posts: [Post]) {
        self.username = username
        self.profilePictureURL = profilePictureURL
        self.posts = posts
    }

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
