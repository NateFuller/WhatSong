//
//  Post.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/13/22.
//

import Foundation

struct Post: Codable { // TODO
    var comments: [String] // list of comment IDs
    var contentURL: URL?
    var description: String
    var username: String
}
