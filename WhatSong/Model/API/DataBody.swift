//
//  DataBody.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

struct DataBody: HTTPBody {
    private let data: Data
    
    var isEmpty: Bool { data.isEmpty }
    var additionalHeaders: [String: String]
    
    init(_ data: Data, additionalHeaders: [String: String] = [:]) {
        self.data = data
        self.additionalHeaders = additionalHeaders
    }
    
    func encode() throws -> Data { data }
}
