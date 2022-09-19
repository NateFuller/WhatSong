//
//  Comment.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/13/22.
//

import Foundation

struct Comment: Codable {
    var content: String
    var date: Date
    var likes: Int
    var userImageURL: String
    var username: String
}

struct CommentViewModel {
    var comment: Comment

    var content: String { comment.content }
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M-dd"

        return dateFormatter.string(from: comment.date)
    }
    var likes: String { "\(comment.likes)" }
    var userImageURL: String { comment.userImageURL }
    var username: String { comment.username }

    func incrementLikes() {
        // TODO: Handle view model update + network call
    }
}
