//
//  Comment+Fixture.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/19/22.
//

import Foundation

extension Comment {
    struct Fixture {
        static var basic = Comment(content: "No offense but your singing is terrible 🤣",
                                   date: Date(),
                                   likes: 1,
                                   userImageURL: "person.circle.fill",
                                   username: "GigaChad")
    }
}
