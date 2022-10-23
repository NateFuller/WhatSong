//
//  EmptyBody.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/22/22.
//

import Foundation

struct EmptyBody: HTTPBody {
    let isEmpty = true
    
    func encode() throws -> Data { Data() }
}
