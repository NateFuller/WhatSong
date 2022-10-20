//
//  View+Placeholder.swift
//  WhatSong
//
//  Created by Nathan Fuller on 10/15/22.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension View {
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading) -> some View {
            
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .italic()
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color("Text.Placeholder"))
                .padding()
        }
    }
}
