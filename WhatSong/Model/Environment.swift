//
//  Environment.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/14/22.
//

import Foundation

struct Environment {
    var domain: String
    
    static let debug = Environment(domain: "localhost:8080")
    static let production = Environment(domain: "api.whatsong.com")
}
