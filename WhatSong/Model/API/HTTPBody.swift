//
//  HTTPBody.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

protocol HTTPBody {
    var isEmpty: Bool { get }
    var additionalHeaders: [String: String] { get }
    func encode() throws -> Data
}

extension HTTPBody {
    var isEmpty: Bool { return false }
    var additionalHeaders: [String: String] { return [:] }
}
