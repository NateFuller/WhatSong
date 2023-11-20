//
//  Text+Extensions.swift
//  WhatSong
//
//  Created by Nathan Fuller on 11/20/23.
//

import SwiftUI

extension Text {
    static func placeholder(_ text: String) -> Text {
        if #available(iOS 17.0, *) {
            Text(text).foregroundStyle(Color.Text.placeholder)
        } else {
            Text(text).foregroundColor(.Text.placeholder)
        }
    }
}
