//
//  JSONBody.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

struct JSONBody: HTTPBody {
    let isEmpty: Bool = false
    var additionalHeaders: [String : String] = [
        "Content-Type": "application/json; charset=utf-8"
    ]
    
    private let encodeValue: () throws -> Data
    
    init<T: Encodable>(_ value: T, encoder: JSONEncoder = JSONEncoder()) {
        self.encodeValue = { try encoder.encode(value) }
    }
    
    func encode() throws -> Data { return try encodeValue() }
}
