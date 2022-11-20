//
//  BannerViewModifier.swift
//  WhatSong
//
//  Created by Nathan Fuller on 11/15/22.
//

import SwiftUI

struct BannerViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    let data: BannerData
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        ZStack {
            content
            VStack(spacing: 0) {
                if isPresented {
                    BannerView(data: data)
                        .animation(.easeInOut, value: isPresented)
                        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                        .onTapGesture {
                            self.isPresented = false
                        }
                }
                Spacer()
            }
            .background(.clear)
        }
    }
}

extension View {
    func banner(isPresented: Binding<Bool>, data: BannerData, action: (() -> Void)? = nil) -> some View {
        self.modifier(BannerViewModifier(isPresented: isPresented, data: data, action: action))
    }
}
