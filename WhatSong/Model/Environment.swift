//
//  Environment.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/14/22.
//

import Foundation

struct Environment {
    var domain: String
    
    private static let debug = Environment(domain: "localhost:8080")
    private static let prod = Environment(domain: "api.whatsong.com")
    
    static var shared: Environment {
        #if DEBUG
        return .debug
        #else
        return .prod
        #endif
    }
}
