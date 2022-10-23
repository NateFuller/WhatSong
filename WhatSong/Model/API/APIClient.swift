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
}
