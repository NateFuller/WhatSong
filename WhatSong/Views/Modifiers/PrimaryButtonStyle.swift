//
//  PrimaryButtonStyle.swift
//  WhatSong
//
//  Created by Nathan Fuller on 11/21/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .italic()
            .font(.system(size: 24))
            .fontWeight(.semibold)
            .foregroundColor(.Text.primary)
            
    }
}
