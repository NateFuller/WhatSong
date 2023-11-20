//
//  WSTextFieldStyle.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/15/22.
//

import Foundation
import SwiftUI

struct WSTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .accentColor(.Text.primary)
            .padding()
            .font(.custom("Helvetica Neue Medium Italic", size: 18))
            .foregroundColor(.Text.input)
            .background(Color.Background.input)
            .cornerRadius(8)
    }
}
