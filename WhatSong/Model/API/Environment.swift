//
//  Environment.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/14/22.
//

import Foundation

struct Environment {
    var host: String
    var port: Int?
    var scheme: String = "http"
    
    static let debug = Environment(host: "localhost", port: 8080)
    static let production = Environment(host: "api.whatsong.com")
}
