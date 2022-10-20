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
            .accentColor(Color("Accent"))
            .padding()
            .font(.custom("Helvetica Neue Medium Italic", size: 18))
            .foregroundColor(Color("Text.Input"))
            .background(Color("Background.Input"))
            .cornerRadius(8)
    }
}
