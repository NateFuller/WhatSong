//
//  User+Fixture.swift
//  WhatSong
//
//  Created by Nathan Fuller on 9/13/22.
//

import Foundation

extension User {
    struct Fixture {
        static var basic = User(createdAt: Date(), email: "testemail@testdomain.com")
    }
}
